#This script updates the mmwave profile configuration files
#for the mmwave demo. Valid only for xwr14xx scripts.
#syntax: perl mmwDemo_xwr14xx_update_config.pl <your_cfg_file> 
#output file: <your_cfg_file>_updated

die "syntax: $0   <Input cfg file> \n" if ($#ARGV != 0);
$inputFile = $ARGV[0]; 
$scriptName = $0;
open INPUT, $inputFile or die "Can't open $inputFile\n";
$outputFile = ">" . $inputFile . "_updated";
open OUTPUT, $outputFile or die "\nCan't create file to update config: " . $outputFile."\n";

$scriptVersion = "1.1";


#warning banner
$warningBanner = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";

#Comment to be added when a new command is inserted in the script
$newCmdMsg = "\%Inserting new mandatory command. Check users guide for details.\n";

#String appended to the begining of the command
$update_string = " -1";

#Updating the config file to work with visualizer given by the version below
# visualizerVersion = v1.v2.v3
$v1 = 1;
$v2 = 1;
$v3 = 0;
$visualizerVersion = $v1.".".$v2.".".$v3;

#first go through the file to check for missing commands introduced in the latest release
$clutterRemovalFlag = 0;
$calibDcRangeSigFlag = 0;
$rxSatMonFlag = 0;
$sigImgMonFlag = 0;
$analogMonFlag = 0;
$compRangeBiasAndRxChanPhaseFlag = 0;
$measureRangeBiasAndRxChanPhaseFlag = 0;
$missingCmdFlag = 0;
$lineCount = 0;
while (<INPUT>) 
{
    $lineCount++;
    $i = $_;
    if (index($i,"clutterRemoval")>=0 ) 
    {
       $clutterRemovalFlag = 1;
       next;       
    }
    if (index($i,"calibDcRangeSig")>=0 ) 
    {
       $calibDcRangeSigFlag = 1;
       next;       
    }
    if (index($i,"compRangeBiasAndRxChanPhase")>=0 ) 
    {
       $compRangeBiasAndRxChanPhaseFlag = 1;
       next;       
    }    
    if (index($i,"measureRangeBiasAndRxChanPhase")>=0 ) 
    {
       $measureRangeBiasAndRxChanPhaseFlag = 1;
       next;       
    }    

    if (index($i,"CQRxSatMonitor")>=0)
    {
       $rxSatMonFlag = 1;
       next;
    }
    if (index($i,"CQSigImgMonitor")>=0)
    {
       $sigImgMonFlag = 1;
       next;
    }
    if (index($i,"analogMonitor")>=0)
    {
       $analogMonFlag = 1;
       next;
    }    
    if (index($i,"sensorStart")>=0)
    {
        $sensorStartLine = $lineCount;
    }
}
$warningMsg = $warningBanner."The following mandatory command(s) was(were) added to the output script. Check the users guide for details.\n";

if($clutterRemovalFlag == 0)
{
    $missingCmdFlag = 1;
    $warningMsg = $warningMsg."Command: clutterRemoval\n";
}
if($calibDcRangeSigFlag == 0)
{
    $missingCmdFlag = 1;
    $warningMsg = $warningMsg."Command: calibDcRangeSig\n";
}
if($analogMonFlag == 0)
{
    $missingCmdFlag = 1;
    $warningMsg = $warningMsg."Command: analogMonitor\n";
}
if($sigImgMonFlag == 0)
{
    $missingCmdFlag = 1;
    $warningMsg = $warningMsg."Command: CQSigImgMonitor\n";
}
if($rxSatMonFlag == 0)
{
    $missingCmdFlag = 1;
    $warningMsg = $warningMsg."Command: CQRxSatMonitor\n";
}
if($compRangeBiasAndRxChanPhaseFlag == 0)
{
    $missingCmdFlag = 1;
    $warningMsg = $warningMsg."Command: compRangeBiasAndRxChanPhase\n";
}
if($measureRangeBiasAndRxChanPhaseFlag == 0)
{
    $missingCmdFlag = 1;
    $warningMsg = $warningMsg."Command: measureRangeBiasAndRxChanPhase\n";
}
$warningMsg = $warningMsg.$warningBanner;

seek INPUT, 0, 0;

#create output file
print OUTPUT "\%This file was updated by script ",$scriptName," version:",$scriptVersion,"\n";
print OUTPUT "\%This file is compatible with Visualizer Version:",$visualizerVersion,"\n";
$lineCount = 0;
while (<INPUT>) 
{
    #print "$_\n";
    $lineCount++;
    if($lineCount == $sensorStartLine)
    {
        #Lets place here the missing commands, just before sensorStart cmd
        if($clutterRemovalFlag == 0)
        {
            print OUTPUT $newCmdMsg . "clutterRemoval 0\n";
        }
        if($calibDcRangeSigFlag == 0)
        {
            print OUTPUT $newCmdMsg . "calibDcRangeSig 0 -5 8 256\n";
        }
        if($compRangeBiasAndRxChanPhaseFlag == 0)
        {
            print OUTPUT $newCmdMsg . "compRangeBiasAndRxChanPhase 0.0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0\n";
        }
        if($measureRangeBiasAndRxChanPhaseFlag == 0)
        {
            print OUTPUT $newCmdMsg . "measureRangeBiasAndRxChanPhase 0 1.5 0.2\n";
        }
        if($rxSatMonFlag == 0)
        {
            # These are example configurations
            print OUTPUT $newCmdMsg . "CQRxSatMonitor 0 3 4 13 0\n";
        }
        if($sigImgMonFlag == 0)
        {
            # These are example configurations
            print OUTPUT $newCmdMsg . "CQSigImgMonitor 0 13 4\n";
        }
        if($analogMonFlag == 0)
        {
            # Disable CQ monitor since the configuration need to be sync with profile cfg
            print OUTPUT $newCmdMsg . "analogMonitor 0 0\n";
        }
    }
    $i = $_;
    # Just copy line to output.
    print OUTPUT $i;        
}
close (INPUT);
close (OUTPUT);
if($missingCmdFlag == 1)
{
    die $warningMsg;
}

