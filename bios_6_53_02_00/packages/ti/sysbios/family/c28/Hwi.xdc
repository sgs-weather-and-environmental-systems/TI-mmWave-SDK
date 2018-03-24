/*
 * Copyright (c) 2015, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== Hwi.xdc ========
 */

package ti.sysbios.family.c28;

import xdc.rov.ViewInfo;

import xdc.runtime.Diags;
import xdc.runtime.Log;
import xdc.runtime.Assert;
import xdc.runtime.Error;

/*!
 *  ======== Hwi ========
 *  C28x Hardware Interrupt Manager
 *  
 *  This Hwi module provides C28 family-specific implementations of the
 *  APIs defined in {@link ti.sysbios.interfaces.IHwi IHwi}.
 *
 *  Additional C28 device-specific APIs are also provided.
 *
 *  ISRs specified with Hwi_plug will not go through the dispatcher; the
 *  ISR function will be directly plugged into the vector table. Hwi_plug can 
 *  be used for any ISR which does not call any SYS/BIOS APIs.
 *  
 *  ISRs can be plugged or created statically in the configuration script or 
 *  dynamically at runtime.
 *
 *  @p(html)
 *  <h3> PIE interrupts </h3>
 *  The peripheral interrupt expansion (PIE) block multiplexes 96 interrupts
 *  into 12 CPU interrupts. The PIE vector table includes entries for each of
 *  these 96 interrupts.  The relationship between the numbers corresponding
 *  to PIE interrupts and their groups (CPU interrupt) is as follows:
 *  PIEGROUPNUM = [(PIENUM - 32) / 8] + 1
 *  
 *  <h4>PIE MUXed Peripheral Interrupt Vector Table</h4>
 *  The table below shows a mapping between the PIENUM (interrupt id) and the
 *  various PIE groups. INTX.Y represents the interrupt number for the PIE 
 *  interrupt belonging to group X and group-specific id Y. 
 *  <br><br>
 *  <table border="1" cellpadding="3">
 *  <tr><th>      </th><th>INTX.1</th><th>INTX.2</th><th>INTX.3</th><th>INTX.4</th><th>INTX.5</th><th>INTX.6</th><th>INTX.7</th><th>INTX.8</th></tr>
 *  <tr><th>INT1.Y</th><td>32</td><td>33</td><td>34</td><td>35</td><td>36</td><td>37</td><td>38</td><td>39</td></tr>
 *  <tr><th>INT2.Y</th><td>40</td><td>41</td><td>42</td><td>43</td><td>44</td><td>45</td><td>46</td><td>47</td></tr>
 *  <tr><th>INT3.Y</th><td>48</td><td>49</td><td>50</td><td>51</td><td>52</td><td>53</td><td>54</td><td>55</td></tr>
 *  <tr><th>INT4.Y</th><td>56</td><td>57</td><td>58</td><td>59</td><td>60</td><td>61</td><td>62</td><td>63</td></tr>
 *  <tr><th>INT5.Y</th><td>64</td><td>65</td><td>66</td><td>67</td><td>68</td><td>69</td><td>70</td><td>71</td></tr>
 *  <tr><th>INT6.Y</th><td>72</td><td>73</td><td>74</td><td>75</td><td>76</td><td>77</td><td>78</td><td>79</td></tr>
 *  <tr><th>INT7.Y</th><td>80</td><td>81</td><td>82</td><td>83</td><td>84</td><td>85</td><td>86</td><td>87</td></tr>
 *  <tr><th>INT8.Y</th><td>88</td><td>89</td><td>90</td><td>91</td><td>92</td><td>93</td><td>94</td><td>95</td></tr>
 *  <tr><th>INT9.Y</th><td>96</td><td>97</td><td>98</td><td>99</td><td>100</td><td>101</td><td>102</td><td>103</td></tr>
 *  <tr><th>INT10.Y</th><td>104</td><td>105</td><td>106</td><td>107</td><td>108</td><td>109</td><td>110</td><td>111</td></tr>
 *  <tr><th>INT11.Y</th><td>112</td><td>113</td><td>114</td><td>115</td><td>116</td><td>117</td><td>118</td><td>119</td></tr>
 *  <tr><th>INT12.Y</th><td>120</td><td>121</td><td>122</td><td>123</td><td>124</td><td>125</td><td>126</td><td>127</td></tr>
 *  </table>
 *  <br>
 *
 *  On F2837X devices, there is an enhanced PIE block that can support up to
 *  192 individual interrupts multiplexed into the 12 CPU interrupts. The
 *  mapping between the PIENUM and PIE groups is identical to that shown in
 *  the above table for the first 96 interrupts. For the next 96 interrupts,
 *  the mapping is shown in the below table.
 *
 *  <h4>ePIE MUXed Peripheral Interrupt Vector Table</h4>
 *  The table below shows a mapping between the PIENUM (interrupt id) and the
 *  various PIE groups for ePIE interrupts 128 to 223. INTX.Y represents the
 *  interrupt number for the PIE interrupt belonging to group X and
 *  group-specific id Y.
 *  <br><br>
 *  <table border="1" cellpadding="3">
 *  <tr><th>      </th><th>INTX.1</th><th>INTX.2</th><th>INTX.3</th><th>INTX.4</th><th>INTX.5</th><th>INTX.6</th><th>INTX.7</th><th>INTX.8</th></tr>
 *  <tr><th>INT1.Y</th><td>128</td><td>129</td><td>130</td><td>131</td><td>132</td><td>133</td><td>134</td><td>135</td></tr>
 *  <tr><th>INT2.Y</th><td>136</td><td>137</td><td>138</td><td>139</td><td>140</td><td>141</td><td>142</td><td>143</td></tr>
 *  <tr><th>INT3.Y</th><td>144</td><td>145</td><td>146</td><td>147</td><td>148</td><td>149</td><td>150</td><td>151</td></tr>
 *  <tr><th>INT4.Y</th><td>152</td><td>153</td><td>154</td><td>155</td><td>156</td><td>157</td><td>158</td><td>159</td></tr>
 *  <tr><th>INT5.Y</th><td>160</td><td>161</td><td>162</td><td>163</td><td>164</td><td>165</td><td>166</td><td>167</td></tr>
 *  <tr><th>INT6.Y</th><td>168</td><td>169</td><td>170</td><td>171</td><td>172</td><td>173</td><td>174</td><td>175</td></tr>
 *  <tr><th>INT7.Y</th><td>176</td><td>177</td><td>178</td><td>179</td><td>180</td><td>181</td><td>182</td><td>183</td></tr>
 *  <tr><th>INT8.Y</th><td>184</td><td>185</td><td>186</td><td>187</td><td>188</td><td>189</td><td>190</td><td>191</td></tr>
 *  <tr><th>INT9.Y</th><td>192</td><td>193</td><td>194</td><td>195</td><td>196</td><td>197</td><td>198</td><td>199</td></tr>
 *  <tr><th>INT10.Y</th><td>200</td><td>201</td><td>202</td><td>203</td><td>204</td><td>205</td><td>206</td><td>207</td></tr>
 *  <tr><th>INT11.Y</th><td>208</td><td>209</td><td>210</td><td>211</td><td>212</td><td>213</td><td>214</td><td>215</td></tr>
 *  <tr><th>INT12.Y</th><td>216</td><td>217</td><td>218</td><td>219</td><td>220</td><td>221</td><td>222</td><td>223</td></tr>
 *  </table>
 *  <br>
 *  @p
 *
 *  PIE interrupts must clear the CPU acknowledge bit for their respective PIE
 *  block before further interrupts from that block can occur. The SYS/BIOS 6
 *  dispatcher (used by interrupts created using {@link #create}) takes care of
 *  this, however this differs from DSP/BIOS 5, in which the application is
 *  expected to acknowledge the interrupt.
 *
 *
 *  PIE interrupt ISRs plugged with {@link #plug}(which do not use the
 *  dispatcher), as well as legacy created PIE HWI instances, must
 *  acknowledge the interrupt manually before returning from the ISR.
 *
 *  @a(Example)
 *
 *  The following configuration code can be used to plug the function
 *  'myHwi' into the vector table for PIE group 5, interrupt 1.  Using the above
 *  table, one can see that this corresponds to interrupt ID 64:
 *
 *  @p(code)
 *      Program.global.hwi5 = Hwi.create(64, '&myHwi');
 *  @p
 *
 *  @a(Minimal Latency Interrupts)
 *  For applications requiring extremely low interrupt latency, 
 *  the 28x Hwi module allows the user to configure interrupts
 *  that operate independent of the SYS/BIOS interrupt dispatcher
 *  which are disabled for extremely short periods of time
 *  as compared to interrupts handled by the dispatcher.
 *  @p(html)
 *  <b>
 *  Though not a precisely correct classification, these
 *  interrupts are referred to as "Zero Latency" interrupts.
 *   </b>
 *  @p
 *  When configured to support "Zero Latency" interrupts, the 
 *  {@link #disable}, {@link #restore}, and {@link #enable} APIs
 *  manipulate the IER register rather than the INTM bit to 
 *  provide critical section protection. The IER bits associated
 *  with the configured "Zero Latency" interrupts are left enabled
 *  while all other bits are disabled and enabled as required to 
 *  functionally achieve the API requirements.
 *  Explicit calls to the {@link #disableIER} or {@link #disablePIEIER}
 *  APIs operate on ALL IER bits, even those associated with the
 *  configured "Zero Latency" interrupts.
 *  Refer to {@link #zeroLatencyIERMask} for using information.
 *
 *  @a(NOTE)
 *  In this Hwi module implementation, the instance config parameter value
 *  {@link #MaskingOption_LOWER} is equivalent to {@link #MaskingOption_SELF}.
 *  Statically configuring a Hwi object's {@link #Params.maskSetting} to 
 *  {@link #MaskingOption_LOWER} will result in the generation of a benign
 *  build warning. Dynamic usages of {@link #MaskingOption_LOWER} will be
 *  silently converted to {@link #MaskingOption_SELF}.
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #clearInterrupt}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #disable}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disableIER}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disableInterrupt}  </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #disablePIEIER}     </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enable}            </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableIER}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enableInterrupt}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enablePIEIER}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getHandle}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getIFR}            </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getIntrReturnAddr} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #Params_init}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #pieEnabled}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #plug}              </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restore}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restoreIER}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restoreInterrupt}  </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #ack}               </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #create}            </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr> 
 *    <tr><td> {@link #construct}         </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #delete}            </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #destruct}          </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getHookContext}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #reconfig}          </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setFunc}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setHookContext}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started (e.g. 
                    Hwi_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started 
                    (e.g. Hwi_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *
 *
 *  </table>
 *  @p
 *
 */

@Template("./Hwi.xdt")  /* generates the vector table and the dispatcher */
@ModuleStartup          /* generate a call to Hwi_init at startup */
@InstanceInitStatic	/* allow constructs in static only systems */

module Hwi inherits ti.sysbios.interfaces.IHwi
{

    // -------- Module Constants --------

    /*! C28 supports 32 interrupts. */
    const Int NUM_INTERRUPTS = 32;

    /*!
     * ======== NUM_INTERRUPTS_PIE ========
     * C28 supports 96 PIE interrupts
     *
     * Note: TMS320F2837X devices have an enhanced PIE that supports
     * 196 PIE interrupts. This config param is set to 192 by default.
     */
    config Int NUM_INTERRUPTS_PIE = 96;
    config Int NUM_INTERRUPTS_ALL = NUM_INTERRUPTS + NUM_INTERRUPTS_PIE;

    // -------- Module Types --------

    /*! Hwi plug function type definition, which doesn't take an arg. */
    typedef Void (*PlugFuncPtr)(void);

    /*! @_nodoc */
    metaonly struct BasicView {
        Ptr         halHwiHandle;
        String      label;
        Int         intNum;
        String      fxn; 
        UArg        arg; 
        Ptr         irp; 
        String      disableMask;   /* Interrupts to mask during ISR.   */
        String      restoreMask;   /* Interrupts to restore after ISR. */
    };
    
    /*! @_nodoc */
    metaonly struct ModuleView {
        String      options[4];
        String      hwiStackPeak;
        SizeT       hwiStackSize;
        Ptr         hwiStackBase;
        String      globalEnable;
        String      shadowIER;
    };

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo = 
        ViewInfo.create({
            viewMap: [
                ['Basic',    {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitBasic',    structName: 'BasicView'}],
                ['Module',   {type: ViewInfo.MODULE,   viewInitFxn: 'viewInitModule',   structName: 'ModuleView'}]
            ]
        });
 
    /*! 
     *  Assert raised when an invalid interrupt number is passed to a Hwi call
     */
    config Assert.Id A_badIntNum = {
        msg: "A_badIntNum: Invalid interrupt number"
    }; 
    
    /*! 
     *  Assert raised when an invalid argument has been passed to a function
     */
    config Assert.Id A_invalidArg = {
        msg: "A_invalidArg: Invalid argument"
    };
    
    /*! 
     *  Assert raised when there is a conflict with the zero latency IER mask
     * 
     *  This assert is raised when trying to create a Hwi with an intNum that
     *  conflicts with the supplied zero latency IER mask.
     */
    config Assert.Id A_zeroLatencyConflict = {
        msg: "A_zeroLatencyConflict: Conflict with zero latency IER mask"
    };
    
    /*! 
     *  Error raised when an unplugged interrupt is flagged
     */
    config Error.Id E_unpluggedInterrupt = {
        msg: "E_unpluggedInterrupt: Unplugged interrupt flagged: intr# %d"
    };

    /*!
     *  Error raised when Hwi is already defined
     */
    config Error.Id E_alreadyDefined = {
        msg: "E_alreadyDefined: Hwi already defined: intr# %d"
    };
    

    // -------- Module Configuration --------

    /*!
     *  ======== NonDispatchedInterrupt ========
     *  Non-dispatched interrupt object
     *
     *  Provided so that XGCONF users can easily plug non-dispatched interrupts
     *  
     *  @field(intNum)      Interrupt number
     *  @field(fxn)         Non-dispatched interrupt service routine (ISR)
     *  @field(enableInt)   Enable the interrupt after plugging the vector
     */
    metaonly struct NonDispatchedInterrupt {
        Int             intNum;
        PlugFuncPtr     fxn;
        Bool            enableInt;
    };

    /*!
     *  ======== nonDispatchedInterrupts ========
     *  Non-dispatched interrupt array.
     *
     *  Provided so that XGCONF users can easily plug non-dispatched interrupts
     */
    metaonly config NonDispatchedInterrupt nonDispatchedInterrupts[string];
    
    /*!
     *  ======== zeroLatencyIERMask ========
     *  Zero Latency IER Mask
     *
     *  CPU interrupts specified in this mask (which corresponds to the 16-bit 
     *  IER register) are carefully managed so that they are disabled for
     *  only the bare minimum time required to safely manipulated the IER 
     *  register.
     *  This means that the  
     *  {@link #disable}, {@link #enable}, and {@link #restore} calls leave the
     *  zero latency CPU interrupts enabled after being called.  Zero latency
     *  operation may be used to ensure minimal interrupt-to-ISR time for 
     *  non-BIOS interrupt handlers in applications that demand low latency.
     *
     *  @a(note)
     *  @p(html)
     *  <b>
     *  While referred to as "Zero Latency Interrupts", the interrupts 
     *  specified in the {@link #zeroLatencyIERMask} are NOT TRULY ZERO
     *  LATENCY!
     *  They are still disabled briefly in software by the Hwi_disable(),
     *  Hwi_restore(), and Hwi_enable() APIs while the IER register bits
     *  are manipulated.
     * 
     *  Additionally, interrupts are globally disabled automatically 
     *  by the 28x hardware when an interrupt is taken. The Hwi module's
     *  interrupt dispatcher quickly (ie: within 30 instructions)
     *  re-enables interrupts globally after carefully manipulating the 
     *  IER register accordingly.
     *  </b>
     *  @p
     *
     *  It is important to note that zero latency and non-zero latency PIE
     *  interrupts may not share a common PIE group. The entire PIE group whose
     *  bit is set in the zeroLatencyIERMask will be treated as zero latency.
     *
     *  @a(warning)
     *  Enabling zero latency mode (specifying a non-zero zeroLatencyIERMask)
     *  generates alternate (and slower) code used to disable, enable and
     *  restore interrupts.  This alternate code will maintain a shadow copy
     *  of interrupt state (IER register and global interrupt state). {@link
     *  #disableIER}, {@link #enableIER} and {@link #restoreIER} will update
     *  both the IER register and its shadow.  The {@link #disable} call
     *  will copy the zero latency IER mask (supplied here) into the IER 
     *  register.  The {@link #enable} call will copy the contents of the
     *  shadow IER register into the actual register. The {@link #restore}
     *  call may either disable or enable the non-zero-latency interrupts.
     *
     *  It is important to be aware of the performance penalty associated with
     *  using zero latency interrupts before using this feature.
     *
     *  Example:
     *  
     *  @p(code)
     *  var Hwi = xdc.useModule('ti.sysbios.family.c28.Hwi');
     *  Hwi.zeroLatencyIERMask = 0x0010; 
     *
     *  // PIE group 5 classified as zero latency
     *  @p
     *      
     */
    config Bits16 zeroLatencyIERMask = 0x0;

    /*!
     *  Issued just prior to Hwi function invocation (with interrupts disabled)
     */
    config Log.Event LM_begin = {
        mask: Diags.USER1 | Diags.USER2,
        msg: "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"
    };

    /*!
     *  Issued just after return from Hwi function (with interrupts disabled)
     */
    config Log.Event LD_end = {
        mask: Diags.USER2,
        msg: "LD_end: hwi: 0x%x"
    };

    // -------- Module Functions --------

    /*!
     *  ======== disable ========
     *  Globally disable interrupts.
     *
     *  Hwi_disable globally disables hardware interrupts and returns an
     *  opaque key indicating whether interrupts were globally enabled or
     *  disabled on entry to Hwi_disable(). 
     *  The actual value of the key is target/device specific and is meant 
     *  to be passed to Hwi_restore(). 
     *
     *  Call Hwi_disable before a portion of a function that needs
     *  to run without interruption. When critical processing is complete, call
     *  Hwi_restore or Hwi_enable to reenable hardware interrupts.
     *
     *  Servicing of interrupts that occur while interrupts are disabled is
     *  postponed until interrupts are reenabled. However, if the same type 
     *  of interrupt occurs several times while interrupts are disabled, 
     *  the interrupt's function is executed only once when interrupts are 
     *  reenabled.
     *
     *  A context switch can occur when calling Hwi_enable or Hwi_restore if
     *  an enabled interrupt occurred while interrupts are disabled.
     *
     *  Hwi_disable may be called from main(). However, since Hwi interrupts
     *  are already disabled in main(), such a call has no effect.
     *
     *  @a(constraints)
     *  If a Task switching API such as 
     *  {@link ti.sysbios.knl.Semaphore#pend Semaphore_pend()}, 
     *  {@link ti.sysbios.knl.Semaphore#post Semaphore_post()},
     *  {@link ti.sysbios.knl.Task#sleep Task_sleep()}, or
     *  {@link ti.sysbios.knl.Task#yield Task_yield()} 
     *  is invoked which results in a context switch while
     *  interrupts are disabled, an embedded call to 
     *  {@link #enable Hwi_enable} occurs
     *  on the way to the new thread context which unconditionally re-enables
     *  interrupts. Interrupts will remain enabled until a subsequent 
     *  {@link #disable Hwi_disable}
     *  invocation.
     *
     *  Swis always run with interrupts enabled.
     *  See {@link ti.sysbios.knl.Swi#post Swi_post()} for a discussion Swis and
     *  interrupts.
     *
     *  @b(returns)     opaque key for use by Hwi_restore()
     */
    @Macro
    override UInt disable();

    /*!
     *  ======== enable ========
     */
    @Macro
    override UInt enable();

    /*!
     *  ======== restore ========
     */
    @Macro
    override Void restore(UInt key);

    /*!
     *  ======== inUseMeta ========
     *  @_nodoc
     *  Check for Hwi already in use.
     *  For internal SYS/BIOS use only. 
     *  Should be called prior to any internal Hwi.create().
     *
     *  @param(intNum)  interrupt number
     */
    metaonly Bool inUseMeta(UInt intNum);

    /*!
     *  ======== plug ========
     *  Plug an interrupt vector with an ISR address.
     *
     *  plug hooks up the specified function as the branch target for a
     *  hardware interrupt (fielded by the CPU) at the vector address
     *  corresponding to intNum. plug does not enable the interrupt. Use
     *  Hwi_enableIER to enable specific interrupts.
     *
     *  This API can plug the full set of vectors supported by the PIE (0-127).
     *
     *  @param(intNum)  interrupt number
     *  @param(fxn)     pointer to ISR function
     */
    Void plug(UInt intNum, PlugFuncPtr fxn);

    /*!
     *  ======== plugMeta ========
     *  Statically plug an interrupt vector with an ISR address.
     *
     *  @param(intNum)  Interrupt number
     *  @param(fxn)     Pointer to ISR function
     */
    metaonly Void plugMeta(UInt intNum, PlugFuncPtr fxn);

    /*!
     *  ======== getHandle ========
     *  Returns Hwi handle associated with intNum
     *
     *  @param(intNum)  Interrupt number
     *
     *  @b(returns)     Hwi handle associated with intNum
     */
    Handle getHandle(UInt intNum);
    
    /*!
     *  ======== disableInterrupt ========
     *  @Hwi The behavior of Hwi_disableInterrupt depends on whether the intNum
     *  is a PIE interrupt number.  If so, the appropriate bit in its group's 
     *  PIEIER register is cleared.  Note that, unlike 
     *  {@link #enableInterrupt}, disableInterrupt does not touch IER bits
     *  when operating upon a PIE interrupt number. If intNum is a non-PIE  
     *  interrupt (1 <= intNum <= 14), then the corresponding bit in the IER 
     *  register is cleared.
     *
     *  @Hwi The return value is a key whose value reflects the previous state of
     *  the PIEIER bit.
     */
    override UInt disableInterrupt(UInt intNum);
    
    /*!
     *  ======== enableInterrupt ========
     *  @Hwi The behavior of enableInterrupt depends on whether the intNum
     *  is a PIE interrupt number.  If so, two operations are
     *  performed. The IER bit for intNum's PIE group is set and the
     *  appropriate bit in its group's PIEIER register is also set.  However,
     *  if intNum is a non-PIE interrupt (1 <= intNum <= 14), then the
     *  corresponding bit in the IER register is set.
     *
     *  @Hwi The return value is a key whose value reflects the previous state of
     *  the PIEIER bit. Note that the key does not reflect
     *  the IER register's previous state even if its state is modified by this
     *  call.
     */
    override UInt enableInterrupt(UInt intNum);
    
    /*!
     *  ======== restoreInterrupt ========
     *  @Hwi The behavior of restoreInterrupt depends on whether the intNum
     *  is a PIE interrupt number.  If so, the supplied key returned by an 
     *  earlier call to {@link #disableInterrupt} and {@link #enableInterrupt}
     *  is used to restore the corresponding PIEIER bit to its state before
     *  the earlier call.
     *  However, if intNum is a non-PIE interrupt (1 <= intNum <= 14), then the
     *  corresponding bit in the IER register is restored using the key.
     */
    override Void restoreInterrupt(UInt intNum, UInt key);

    /*!
     *  ======== clearInterrupt ========
     *  @Hwi The behavior of clearInterrupt depends on whether the intNum
     *  is a PIE interrupt number.  If so, the corresponding PIEIFR bit is 
     *  cleared.  If not (1 <= intNum <= 14), the corresponding IFR bit is 
     *  cleared.
     */
    override Void clearInterrupt(UInt intNum);
    
    /*!
     *  ======== disableIER ========
     *  Disable certain maskable interrupts.
     *
     *  Atomically disables specific interrupts by clearing the bits
     *  specified by mask in the Interrupt Enable Register (IER).
     *
     *  The IER bits to be cleared should be set to 1 in the mask.
     *
     *  @param(mask)    bitmask of interrupts to disable
     *
     *  @b(returns)     previous IER settings bitmask
     */
    Bits16 disableIER(Bits16 mask);

    /*!
     *  ======== enableIER ========
     *  Enable certain maskable interrupts.
     *
     *  Atomically enables specific interrupts by setting the bits 
     *  specified by mask in the Interrupt Enable Register (IER).
     *
     *  The IER bits to be set should be set to 1 in the mask.
     *
     *  @param(mask)    Bitmask of interrupts to enable
     *
     *  @b(returns)     Previous IER settings bitmask
     */
    Bits16 enableIER(Bits16 mask);

    /*!
     *  ======== restoreIER ========
     *  Restore maskable interrupts
     *
     *  Restores maskable interrupts to the state they were in 
     *  when either disableIER() or enableIER() was called.
     *
     *  Atomically writes the given mask to the IER register. Typically used
     *  to restore the IER register to the state returned from a call to
     *  either {@link #disableIER()} or {@link #enableIER()}.
     *
     *  @param(mask)    Bitmask of interrupts to restore
     *
     *  @b(returns)     Previous IER settings bitmask
     */
    Bits16 restoreIER(Bits16 mask);

    /*!
     *  ======== enablePIEIER ========
     *  Enable interrupts in a PIE group
     *
     *  Atomically enable PIE interrupts in a single PIE group
     *  according to supplied PIEIER bitmask
     *
     *  @param(groupNum)    PIE group number
     *  @param(pieMask)     PIEIER enable mask for group
     *
     *  @b(returns)         Previous PIEIER settings bitmask
     */
    Bits16 enablePIEIER(UInt groupNum, Bits16 pieMask);

    /*!
     *  ======== disablePIEIER ========
     *  Disable interrupts in a PIE group
     *
     *  Atomically disable PIE interrupts in a single PIE group
     *  according to supplied PIEIER bitmask
     *
     *  @param(groupNum)    PIE group number
     *  @param(pieMask)     PIEIER disable mask for group
     *
     *  @b(returns)         Previous PIEIER settings bitmask
     */
    Bits16 disablePIEIER(UInt groupNum, Bits16 pieMask);
    
    /*!
     *  ======== restorePIEIER ========
     *  Restores interrupts in a PIE group
     *
     *  Atomically restore PIE interrupts in a single PIE group
     *  according to supplied PIEIER bitmask
     *
     *  @param(groupNum)    PIE group number
     *  @param(pieMask)     PIEIER restore mask for group
     *
     *  @b(returns)         Previous PIEIER settings bitmask
     */
    Bits16 restorePIEIER(UInt groupNum, Bits16 pieMask);

    /*!
     *  ======== getInterruptFlag ========
     *  @_nodoc
     *  Returns IFR/PIEIFR flag corresponding to a single interrupt number
     *
     *  If intNum >= 32, the PIEIFR bit corresponding to intNum is returned.
     *  If 1 <= intNum <= 14, the IFR bit corresponding to intNum is returned.
     *
     *  @param(intNum)      Interrupt number
     *
     *  @b(returns)         Nonzero if interrupt is flagged, zero otherwise
     */   
    Bits16 getInterruptFlag(UInt intNum);
    
    /*!
     *  ======== getIERMask ========
     *  @_nodoc
     *  Calculates IER mask based on an array of C28x interrupt vector IDs
     *
     *  For each vector id the supplied array, a bit in the generated IER mask
     *  is set.  If 1 <= intNum <= 14, the corresponding IER bit is set. If
     *  intNum >= 32, the IER mask bit corresponding to the PIE interrupt's 
     *  group is set.
     *
     *  getIERMask may be used to generate a zero latency IER mask given
     *  an array of vector IDs.
     *
     *  @param(vecIds)      Array of vector IDs
     *
     *  @b(returns)         Calculated IER Mask
     */  
    metaonly UInt getIERMask(UInt vecIds[]);

instance:

    /*! 
     *  Dispatcher auto-nesting interrupt disable mask.
     * 
     *  When the dispatcher's auto interrupt nesting support feature 
     *  is enabled (see {@link #dispatcherAutoNestingSupport}), 
     *  this mask defines which IER bits are disabled prior to invoking
     *  the user's ISR function with GIE = 1.
     *  
     *  disableMask bits set to 1 correspond to IER bits that will be cleared
     *  prior to invoking the ISR.
     *
     *  The value of this mask is normally auto-calculated based on the
     *  value of the maskSetting. However, manual setting of this
     *  mask is enabled by setting the maskSetting to 
     *  {@link #MaskingOption MaskingOption_BITMASK}.
     *
     *  The default value is derived from the 
     *  {@link #MaskingOption MaskingOption_SELF}
     *  maskSetting.
     */
    config Bits16 disableMask = 0;

    /*! 
     *  Dispatcher auto-nesting interrupt restore mask.
     * 
     *  When the dispatcher's auto interrupt nesting support feature 
     *  is enabled (see {@link #dispatcherAutoNestingSupport}), 
     *  this mask defines which IER bits are restored to their previous
     *  setting upon return from the user's ISR function.
     *  
     *  restoreMask bits set to 1 correspond to IER bits that will be restored.
     *  
     *  The value of this mask is normally auto-calculated based on the
     *  value of the maskSetting. However, manual setting of this
     *  mask is enabled by setting the maskSetting to 
     *  {@link #MaskingOption MaskingOption_BITMASK}.
     *
     *  The default value is derived from the 
     *  {@link #MaskingOption MaskingOption_SELF}
     *  maskSetting.
     */
    config Bits16 restoreMask = 0;

    /*!
     *  Interrupt priority. Not supported on this target.
     */
    override config Int priority = 0;

    /*!
     *  ======== reconfig ========
     *  Reconfigure a dispatched interrupt.
     */
    Void reconfig(FuncPtr fxn, const Params *params);
    
    /*!
     *  Enable automatic acknowledgement of PIE interrupts by the Hwi interrupt
     *  dispatcher.
     */
    config Bool enableAck = true;

internal:   /* not for client use */

    /*
     *  ======== postInit ========
     *  finish initializing static and dynamic Hwis
     */
    Int postInit(Object *hwi, Error.Block *eb);

    /* 
     * Swi and Task module function pointers. 
     * Used to decouple Hwi from Swi and Task when 
     * dispatcherSwiSupport or
     * dispatcherTaskSupport is false.
     */
    config UInt (*swiDisable)();
    config Void (*swiRestoreHwi)(UInt);
    config UInt (*taskDisable)();
    config Void (*taskRestoreHwi)(UInt);

    /*
     *  The IFR cregister is write-only, so a special assembly function is
     *  needed to read the value of the IFR on the 28x.
     */
    Bits16 getIFR();
    
    /* 'ack' interrupt in case of PIE */
    Void ack(Handle hwi);
    
    /* Used to temporarily plug PIE vector table when clearing PIEIFR */
    Void interruptReturn();
    
    /* Used in assert that no conflict exists between zero/non-zero latency */
    Bits16 getIERBit(UInt intNum);
    
    /* Interrupt Dispatcher */
    Void dispatchC(Int intNum);
    /* Interrupt dispatcher core */
    Void dispatchCore(Int intNum);

    /* assembly language code that switches SP and calls dispatchCore */
    Void switchAndDispatch(Int intNum);
    
    /* unplugged interrupt handler */
    Void unPluggedInterrupt();

    /* const array to hold all HookSet objects. */
    config HookSet hooks[length] = [];

    /* Meta World Only Hwi Configuration Object. */
    metaonly struct InterruptObj {
        String name;                /* symbol used for vector table entry   */
        Bool used;                  /* Interrupt already defined?           */
        Bool useDispatcher;         /* Should dispatcher handle this Int?   */
        FuncPtr fxn;                /* Dispatched ISR function              */
        PlugFuncPtr pfxn;           /* "Hwi_plug'd" ISR function.           */
    };
    
    /* Used for statically fixing certain PIEIER addresses */
    const Ptr PIEIER1_ADDR = 0x000CE2;

    /* Example string: '0x02a0' */
    metaonly config String zeroLatencyIERMaskStr;
    metaonly config String nonZeroLatencyIERMaskStr;
    
    /*
     * Meta-only array of interrupt objects.
     * This meta-only array of Hwi config objects is initialized
     * in Hwi.xs:module$meta$init().
     */
    metaonly config InterruptObj interrupt[];

    struct Instance_State {
        UInt        intNum;         /* interrupt number                     */
        Bool        enableInt;      /* enable interrupt during startup?     */
        Bool        enableAck;      /* should dispatcher ack the int?       */
        Bits16      disableMask;    /* Interrupts to mask during ISR.       */
        Bits16      restoreMask;    /* Interrupts to restore after ISR.     */
        Bits16      ierBitMask;     /* bit number in IER for the instance   */
        UArg        arg;            /* Argument to Hwi function.            */
        FuncPtr     fxn;            /* Hwi function.                        */
        Irp         irp;            /* for IRP tracking                     */
        Ptr         hookEnv[];
    };
 
    struct Module_State {
        Bits16      ierMask;        /* Initial IER mask                     */
        Char        *isrStack;      /* Points to isrStack address           */
        Char        *taskSP;        /* temporary storage of Task's SP       */
        Handle      dispatchTable[];/* dispatch table                       */
        Irp         irp;            /* current IRP                          */
        Bool        globalEnable;   /* for zero latency only                */
        Bits16      shadowIER;      /* for zero latency only                */
        Ptr         isrStackBase;   /* ISR stack base address               */
        Ptr         isrStackSize;   /* ISR stack size                       */
    };
}
