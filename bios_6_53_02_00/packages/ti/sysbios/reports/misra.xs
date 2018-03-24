/* Misra */
var Misra = xdc.loadCapsule('tisb/misra/filters/Misra.xs');

/* disable a few more rules */
Misra.misraRules["20.12"] = {
    brief: '20.12/R',
    desc: 'The time handling functions of <time.h> shall not be used.',
    remark: 'Tool reports false positives. The use of <time.h> is ' +
            'mandated by POSIX spec and is limited to the POSIX ' +
            'package in SYS/BIOS. If an application needs to conform ' +
            'to this rule, then it should not use the POSIX package.',
    disable: true
};

Misra.misraRules["20.8"] = {
    brief: '20.8/R',
    desc: 'The signal handling facilities of <signal.h> shall not be used.',
    remark: 'Tool reports false positives. The use of <signal.h> is ' +
            'mandated by POSIX spec and is limited to the POSIX ' +
            'package in SYS/BIOS. If an application needs to conform ' +
            'to this rule, then it should not use the POSIX package.',
    disable: true
};

Misra.misraRules["19.17"] = {
    brief: '19.17/R',
    desc: 'All #else, #elif and #endif preprocessor directives shall ' +
        'reside in the same file as the #if or #ifdef directive to which ' +
        'they are related.',
    remark: 'Tool reports false positives',
    disable: true
};

Misra.misraRules["19.15"] = {
    brief: '19.15/R',
    desc: 'Precautions shall be taken in order to prevent the contents ' +
        'of a header file being included twice.',
    remark: 'Tool reports false positives',
    disable: true
};

Misra.misraRules["19.13"] = {
    brief: '19.13/A',
    desc: 'The # and ## preprocessor operators should not be used.',
    remark: 'Coding conventions',
    disable: true
};

Misra.misraRules["19.7"] = {
    brief: '19.7/A',
    desc: 'A function should not be used in preference to a function-like ' +
        'macro.',
    remark: 'Coding conventions',
    disable: true
};

Misra.misraRules["19.6"] = {
    brief: '19.6/R',
    desc: '#undef shall not be used',
    remark: 'XDC generated .h files contain #undef',
    disable: true
};

Misra.misraRules["19.1"] = {
    brief: '19.1/A',
    desc: '#include statements in a file should only be preceded by other ' +
        'preprocessor directives or comments.',
    remark: 'Tool reports false positives',
    disable: true
};

Misra.misraRules["6.3"] = {
    brief: '6.3/A',
    desc: 'typedefs that indicate size and signedness should be used in ' +
        'place of the basic numerical types.',
    remark: 'Coding conventions',
    disable: true
};

Misra.misraRules["5.4"] = {
    brief: '5.4/R',
    desc: 'A tag name shall be a unique identifier.',
    remark: 'Coding conventions.   The C standard explicitly states (ISO/IEC ' +
        '9899:1999 6.2.3) that type tags do _not_ need to be unique w.r.t. ' +
        'other identifiers; this pattern is required by our naming/coding ' +
        'conventions so that _all_ types can be consistently identified ' +
        'solely by their letter case.',
    disable: true
};

Misra.misraRules["5.3"] = {
    brief: '5.3/R',
    desc: 'A typedef name shall be a unique identifier.',
    remark: 'Coding conventions',
    disable: true
};

Misra.misraRules["5.2"] = {
    brief: '5.2/R',
    desc: 'Identifiers in an inner scope shall not use the same name as ' +
        'an identifier in an outer scope, and therefore hide that identifier.',
    remark: 'Coding conventions',
    disable: true
};

/* enable a few rules */
Misra.misraRules["5.2"].disable = false;
Misra.misraRules["5.3"].disable = false;
Misra.misraRules["5.4"].disable = false;
Misra.misraRules["5.6"].disable = false;
Misra.misraRules["5.7"].disable = false;
Misra.misraRules["6.3"].disable = false;
Misra.misraRules["8.5"].disable = false;
Misra.misraRules["10.1"].disable = false;
Misra.misraRules["10.3"].disable = false;
Misra.misraRules["10.6"].disable = false;
Misra.misraRules["11.3"].disable = false;
Misra.misraRules["11.4"].disable = false;
Misra.misraRules["12.1"].disable = false;
Misra.misraRules["12.6"].disable = false;
Misra.misraRules["12.7"].disable = false;
Misra.misraRules["14.6"].disable = false;
Misra.misraRules["14.7"].disable = false;
Misra.misraRules["14.8"].disable = false;
Misra.misraRules["14.9"].disable = false;
Misra.misraRules["14.10"].disable = false;
Misra.misraRules["15.2"].disable = false;
Misra.misraRules["15.3"].disable = false;
Misra.misraRules["17.4"].disable = false;
Misra.misraRules["17.5"].disable = false;
Misra.misraRules["18.4"].disable = false;

/* not necessary, but 'nicer' */
Misra.misraSort();
