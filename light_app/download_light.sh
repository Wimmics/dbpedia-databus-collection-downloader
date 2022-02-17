#!/usr/bin/env bash
if [ -z ${TARGET_DIR+x} ]; then TARGET_DIR='/root/data'; fi
if [ -z ${LOOKUP_DIR+x} ]; then LOOKUP_DIR=''; fi

echo "WORKING DIR IS ${TARGET_DIR}";
echo "---------------------------------";

fileUPDT=${TARGET_DIR}/last_update.txt;
echo "update file is  ${fileUPDT}";

if test -f "$fileUPDT"; then
    lastUpdate=`head -n 1 $fileUPDT`;
	echo "[DATA CHECK] datasets updated $lastUpdate";
else
	echo "[DATA CHECK] no dataset saved for the moments";
	lastUpdate='1992-08-25';
fi

echo "---------------------------------";

echo "[LAST RELEASE] check if new releases exists...";
query="PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> PREFIX db: <https://databus.dbpedia.org/> PREFIX dcat: <http://www.w3.org/ns/dcat#> PREFIX dct: <http://purl.org/dc/terms/> PREFIX dataid: <http://dataid.dbpedia.org/ns/core#> SELECT MAX(?version) AS ?result WHERE {{SELECT DISTINCT ?version WHERE {GRAPH ?g {?dataset dcat:distribution ?distribution . ?distribution dataid:file ?file . {?dataset dataid:group <https://databus.dbpedia.org/dbpedia/generic> . { ?distribution <http://dataid.dbpedia.org/ns/core#compression> 'bzip2'^^<http://www.w3.org/2001/XMLSchema#string> . } { ?distribution <http://dataid.dbpedia.org/ns/core#formatExtension> 'ttl'^^<http://www.w3.org/2001/XMLSchema#string> . } {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/commons-sameas-links> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/commons-sameas-links> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/infobox-properties> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/infobox-properties> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/page> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/page> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/wikipedia-links> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/wikipedia-links> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/infobox-property-definitions> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/infobox-property-definitions> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/labels> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/labels> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/redirects> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/redirects> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/categories> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/categories> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/disambiguations> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/disambiguations> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/article-templates> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/article-templates> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/revisions> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/revisions> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/interlanguage-links> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/interlanguage-links> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/images> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/images> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/homepages> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/homepages> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/geo-coordinates> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/geo-coordinates> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/topical-concepts> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/topical-concepts> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/wikilinks> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/wikilinks> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/external-links> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/generic/external-links> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } } UNION {?dataset dataid:group <https://databus.dbpedia.org/dbpedia/text> . { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } { ?distribution <http://dataid.dbpedia.org/ns/core#compression> 'bzip2'^^<http://www.w3.org/2001/XMLSchema#string> . } {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/text/short-abstracts> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/text/short-abstracts> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/text/long-abstracts> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/text/long-abstracts> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } } UNION {?dataset dataid:group <https://databus.dbpedia.org/dbpedia/mappings> . { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/geo-coordinates-mappingbased> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/geo-coordinates-mappingbased> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/mappingbased-literals> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/mappingbased-literals> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/mappingbased-objects> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/mappingbased-objects> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/instance-types> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/instance-types> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/mappingbased-objects-uncleaned> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/mappingbased-objects-uncleaned> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } UNION {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/specific-mappingbased-properties> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/mappings/specific-mappingbased-properties> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } } UNION {?dataset dataid:group <https://databus.dbpedia.org/dbpedia/wikidata> . {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/wikidata/sameas-all-wikis> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/dbpedia/wikidata/sameas-all-wikis> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } }  UNION {?dataset dataid:group <https://databus.dbpedia.org/vehnem/yago> . {?dataset dataid:artifact <https://databus.dbpedia.org/vehnem/yago/links> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/vehnem/yago/links> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } } } UNION {?dataset dataid:group <https://databus.dbpedia.org/vehnem/replaced-iris> . {?dataset dataid:artifact <https://databus.dbpedia.org/vehnem/replaced-iris/labels> . {?distribution dct:hasVersion ?version {SELECT (?v as ?version) {?dataset dataid:artifact <https://databus.dbpedia.org/vehnem/replaced-iris/labels> . ?dataset dct:hasVersion ?v . } ORDER BY DESC (?version) LIMIT 1 } } { ?distribution <http://dataid.dbpedia.org/ns/cv#lang> 'fr'^^<http://www.w3.org/2001/XMLSchema#string> . } } } } } } }"
RESULT=$(curl -H "Accept: application/sparql-results+json"	-H "Content-Type: application/x-www-form-urlencoded" \
	-H "Connection: keep-alive" -H "Cache-Control: no-cache" --data-urlencode "query=${query}" -X POST https://databus.dbpedia.org/repo/sparql );

date_in_db=$(echo $RESULT | grep -Eo '[[:digit:]]{4}.[[:digit:]]{2}.[[:digit:]]{2}');
startd=$(tr '.' '-' <<<"$date_in_db" );
echo "[LAST RELEASE] last release date is : $date_in_db";

echo "---------------------------------";
if [[ $startd != $lastUpdate ]] && [[ $startd > $lastUpdate ]]; then echo " $startd > $lastUpdate "; else echo " $startd <  $lastUpdate " ;fi
echo "---------------------------------";
if [[ $startd != $lastUpdate ]] && [[ $startd > $lastUpdate ]];
then
	echo "---------------------------------";
	echo "[DOWNLOAD] Begin download of data artefacts...";

	### CREATE TEMPO DIR
	tempoDIR="tempo";	
	mkdir -p ${TARGET_DIR}/${tempoDIR} ;
        cd ${TARGET_DIR}/${tempoDIR};

        ### DOWNLOAD DATA
	touch "${TARGET_DIR}/${tempoDIR}/download.lck";
	query2=$(curl -H "Accept:text/sparql" ${COLLECTION_URI})
	files=$(curl -H "Accept: text/csv" --data-urlencode "query=${query2}" https://databus.dbpedia.org/repo/sparql | tail -n+2 | sed 's/"//g')
	while IFS= read -r file ; do
		name=$file;
		new_name=$(echo $name | sed 's+https://databus.dbpedia.org/++g'|sed 's+/+_+g')
		wget -O $new_name $file;
	done <<< "$files"
	
	rm "${TARGET_DIR}/${tempoDIR}/download.lck";
       
        if [[ ${LOOKUP_DIR} != '' ]];then
		echo "[LOOKUP] Update lookup data ";
		rm -rf ${LOOKUP_DIR};
		mkdir -p "${LOOKUP_DIR}";
		declare -a LIST_FILES=("dbpedia_generic_labels" "dbpedia_generic_redirects" "dbpedia_text_short-abstracts" "dbpedia_mappings_mappingbased-objects" "dbpedia_mapping_instance-type");
		# Iterate the string array using for loop
		for val in ${LIST_FILES[@]}; do
	    		echo "---------------"
	    		echo "looking for $val files";
	    		echo "---------------"
	    		for FILE in $(find ${TARGET_DIR}/${tempoDIR} -type f -name "$val*");   do
	        		cp $FILE "${LOOKUP_DIR}";
	        		echo "> found : ${FILE}";
	    		done
		done
	fi

 
	echo "[ARCHIVE] archive old data and moove new one into lastUpdate dir"
	cd ${TARGET_DIR}
	newDIR="lastUpdate";
	oldDIR="$lastUpdate";
	mkdir -p ${TARGET_DIR}/${newDIR} ;

	#now=$(date +%Y-%m-%d);

	if [[ -d ${TARGET_DIR}/${newDIR} ]] && [[ -f "$fileUPDT" ]]; then
		if [[ "$(ls -A ${TARGET_DIR}/${newDIR})" ]]; then

			echo "[ARCHIVE] we already have data from last releases, we archive it.";
			mkdir -p ${TARGET_DIR}/oldReleases ;
			nb_files=$(ls ${TARGET_DIR}/oldReleases/ | wc -l);
			echo "[ARCHIVE] We already have $nb_files data release archived.";

			if [[ $nb_files > 5 ]]; then
				DIFFERENCE=$((nb_files-5));
				echo "[ARCHIVE]  So we need to delete $DIFFERENCE files";
				xargs rm -f <<< $(ls ${TARGET_DIR}/oldReleases/* | sort -n | head -${DIFFERENCE});
			fi
			cd ${TARGET_DIR}/${newDIR};
			tar -zcvf ${oldDIR}.tar.gz *;
			mv ${oldDIR}.tar.gz ${TARGET_DIR}/oldReleases/;
			rm -rf ${TARGET_DIR}/${newDIR}/*;
			# tar -zcvf ${TARGET_DIR}/oldReleases/${oldDIR}.tar.gz --absolute-names ${TARGET_DIR}/${newDIR}; 
			# rm -rf ${TARGET_DIR}/${newDIR}/*;
		fi
	else
		echo "[ARCHIVE] no data to archive";
	fi

	echo "---------------------------------";
	echo "[END PROCESS] Clean directories"
	mv ${TARGET_DIR}/${tempoDIR}/*  ${TARGET_DIR}/${newDIR};
	rm -rf  ${TARGET_DIR}/${tempoDIR};
	echo "---------------------------------";
	if  [[ "$(ls -A ${TARGET_DIR}/${newDIR})" ]]; then
		echo "$startd" > ${TARGET_DIR}/last_update.txt;
		echo "[END PROCESS] Save last date of update";
	else
		echo "[END PROCESS] Problem with last updated data";
	fi	
else 
	echo "[END PROCESS] data already up-to-date";
fi  
echo "[END PROCESS] See you !";
