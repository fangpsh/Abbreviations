#!/usr/bin/env bash

OUT="./AppleDictionary/Abbreviations.xml"


cat << EOF > ${OUT}
<?xml version="1.0" encoding="UTF-8"?>
<d:dictionary xmlns="http://www.w3.org/1999/xhtml" xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
<d:entry id="dictionary_application" d:title="Dictionary application">
    <d:index d:value="Dictionary application"/>
    <h1>Dictionary application </h1>
    <p>
        An application to look up dictionary on Mac OS X.<br/>
    </p>
    <span class="column">
        The Dictionary application first appeared in Tiger.
    </span>
    <span class="picture">
        It's application icon looks like below.<br/>
        <img src="Images/dictionary.png" alt="Dictionary.app Icon"/>
    </span>    
</d:entry>
EOF


######content

cat sources.txt |while read line 
do
    word=`echo $line|cut -d ' ' -f 1`
    abbrev=`echo $line|cut -d ' ' -f 2 |tr ',' ' '`


cat << EOF >> ${OUT}
<d:entry id="${word}" d:title="${word}">
    <d:index d:value="${word}" d:title="${word}"/>
EOF

#####################
   for v in ${abbrev};
   do

cat << EOF >> ${OUT}
    <d:index d:value="${v}"  d:title="${v}"/>
EOF
     done

#####################
cat << EOF >> ${OUT}
    <div>
	    ${word}
EOF

####################
    for v in ${abbrev};
    do

cat << EOF >> ${OUT}
         <li>${v}</li>
EOF
    done

###################

cat << EOF >> ${OUT}
         <br />
    </div>
</d:entry>    
EOF

done


######fron_black_matter

cat << EOF >> ${OUT}
<d:entry id="front_back_matter" d:title="Front/Back Matter">
    <h1><b>Abbreviations</b></h1>
    <div>
        This dictionary is used to find the abbreviation of a word.<br/><br/>
        Issue/PR: <a href="https://github.com/fangpeishi/Abbreviations">github.com/fangpeishi/Abbreviations</a>
    </div>
</d:entry>
</d:dictionary>
EOF
