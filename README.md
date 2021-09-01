#'rstudioapi::getSourceEditorContext()$path
#'whoami="~/ws/lib-dfmmetadata/README.md"
#'owner="orcikl"

## lib-dfmmetadata

lib[rary]-[]d[anse]f[or]m[obility]metadata

### TODO

1. finish structure
2. replicate to usecases (objects)
3. shema json
4. library / extension vscode

### Consider

https://github.com/Danse4mobility/lib-dfmname

https://github.com/Danse4mobility/lib-dfmmedia

https://github.com/Danse4mobility/d4m-sck-manpro
/[environments,infrastructure,authorization,workflow,documentation]

### About me

In a single place I provide templates and methods how to compose metadata for
object in danse name space.

### What do I do

> Structures are pasive, no output
> Verification of valid metadata

### Governing methods

https://code.visualstudio.com/docs/languages/json

## Manipulate me

**Updates and locations**

Stack is updated locally, `vscode` prefered.

**view me local**

`\\wsl$\Ubuntu\home\hylmarj\ws\lib-dfmmetadata\README.md`

**render me**

`R -e "rmarkdown::render('$HOME/ws/lib-dfmmetadata/README.md', output_file = '$HOME/ws/lib-dfmmetadata/README.html')"`

**edit me**

`code -r $HOME/ws/lib-dfmmetadata/README.md`

**list content**

cd $HOME/ws/lib-dfmmetadata; find $(pwd) -name .git -prune -o -name "*"
_____________________________________________________________________________________

## Name example media object types

**name**

user_cell_move_qgis_plugin___case_vector_long_distance_in_short_time___analyse___itemCreation___vsb___ccByNcNd___StillImage.png

**structure**

<table class="tg">
<thead>
  <tr>
    <th class="tg-0lax">typeMask</th>
    <th class="tg-0lax"><span style="background-color:#FFF">nameWriting</span></th>
    <th class="tg-0lax">nameCamel</th>
    <th class="tg-0lax">description</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"><span style="font-weight:normal">maskObjectsMediaGroup</span></td>
    <td class="tg-0lax"><span style="font-weight:normal;background-color:#FFF">Runner</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">runner</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">Runner. Processing program or stack. Values are obtained by consulting `github`, `gitlab`, `codecommit`. English is the primary language. Objects in this namespace are not translated.</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:normal">maskObjectsMediaGroup</span></td>
    <td class="tg-0lax"><span style="font-weight:normal;background-color:#FFF">Title</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">title</span></td>
    <td class="tg-0lax"><a href="https://dublincore.org/specifications/dublin-core/dcmi-terms/">https://dublincore.org/specifications/dublin-core/dcmi-terms/</a></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:normal">maskObjectsMediaGroup</span></td>
    <td class="tg-0lax"><span style="font-weight:normal;background-color:#FFF">Object motivation</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">objectMotivation</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">Object motivation. English is the primary language. Objects in this namespace are not translated.</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:normal">maskObjectsMediaGroup</span></td>
    <td class="tg-0lax"><span style="font-weight:normal;background-color:#FFF">Accrual method</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">accrualMethod</span></td>
    <td class="tg-0lax"><a href="https://dublincore.org/specifications/dublin-core/dcmi-terms/">https://dublincore.org/specifications/dublin-core/dcmi-terms/</a></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:normal">maskObjectsMediaGroup</span></td>
    <td class="tg-0lax"><span style="font-weight:normal;background-color:#FFF">Rights holder</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">rightsHolder</span></td>
    <td class="tg-0lax"><a href="https://dublincore.org/specifications/dublin-core/dcmi-terms/">https://dublincore.org/specifications/dublin-core/dcmi-terms/</a></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:normal">maskObjectsMediaGroup</span></td>
    <td class="tg-0lax"><span style="font-weight:normal;background-color:#FFF">License</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">license</span></td>
    <td class="tg-0lax"><a href="https://dublincore.org/specifications/dublin-core/dcmi-terms/">https://dublincore.org/specifications/dublin-core/dcmi-terms/</a></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:normal">maskObjectsMediaGroup</span></td>
    <td class="tg-0lax"><span style="font-weight:normal;background-color:#FFF">Type object</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">typeObject</span></td>
    <td class="tg-0lax"><span style="font-weight:normal">Type objects from `DCMI Type Vocabulary` and `DANSE Type Vocabulary`. In order to identify which objects belong to which namespace, attribute `uri` is used. English is the primary language. Objects in this namespace are not translated.</span></td>
  </tr>
</tbody>
</table>

## Functions (as of 2021-09-01)

1) metadata.attach.path.based

# 1) metadata.attach.path.based (last update 2021-08-30)
This function generates a json file of item metadata given an item path where it is stored. Other input parameters are parameters describing the item (written in the output json file). 

#### Important features
- Function throws error if the item at the given path does not exist.
- Value of a parameter if not provided is "xxx"
- Function outputs a json without parsed parameters (those in the table above) if the item at the given path exists but is not named according to the naming rules

**Input parameters are:** 

EACH PARAMETER EXCEPT FOR item_path CAN BE OMITTED!

- item_path          
  - path where the item is stored - string
- item_primaryKey                     
  - primary key identificator- string
- item_sortKey                     
  - sort key identificator- string
- item_hashId
  - hashID identificator- string
- item_typeEnvironmentService
  - parameter of resource section - string
- item_typeObjectDeliveryFormats
  - parameter of resource section - string
- item_content
  - parameter of resource section - string
- item_hashIdCollection
  - parameter of resource section - hashID identificator of the collection - string
- item_SortKeyCollection
  - parameter of resource section - sort key of the collection - string
- item_descriptionCollection
  - parameter of resource section - description of the collection - string
- item_location_typeEnvironmentService
  - parameter of location section - type of storage - string
- item_location_account
  - parameter of location section - string
- item_location_bucket
  - parameter of location section - string
- item_location_key
  - parameter of location section - parsed location key- string
- item_languagePrimary
  - language of the item - string
- item_nameSpace_type
  - string
- item_nameSpace_destination
  - string
- item_nameSpace_value
  - string
- item_publishDefault
  - string 
- item_titleOptions_full_cs
  - parameter of about section - title in cz - string 
- item_titleOptions_full_en
  - parameter of about section - title in en - string 
- item_titleOptions_short_cs
  - parameter of about section - short title in cz - string 
- item_titleOptions_short_en
  - parameter of about section - short title in en - string 
- item_description_full_cs
  - parameter of about section - description in cz - string 
- item_description_full_en
  - parameter of about section - description in en - string 
- item_description_short_cs
  - parameter of about section - short description in cz - string            
- item_description_short_en
  - parameter of about section - short description in en - string 
- item_organisation
  - parameter of about section - organisation that created the item - string 
- item_owner
  - parameter of about section - owner of the item - string 
- item_creator
  - parameter of about section - creator of the item - string 
- item_keyword_cs
  - parameter of about section - keywords in cz - vector
- item_keyword_en
  - parameter of about section - keywords in en - vector
- item_license_public
  - parameter of about section - is the item public? - string
- item_date_validFrom
  - parameter of date section - from when the item is valid - string 
- item_date_validTill
  - parameter of date section - until when the item is valid - string 
- item_tag
  - tags - list 
- item_legend
  - list of the structure of information about the item - e.g. names of axes, statistical values etc. - output of the functions 3 - 6

**Dataframes and lists used in the example below**
- list_tag
```
list_tag = list()
  list_tag["key1"] = "value1"
  list_tag["key2"] = "value2"
```
- list_legend.ts
```
list_legend = list()
  list_legend["X"] = "X"
  list_legend["Y"] = "Y"
```

**EXAMPLE of use:**

```text
metadata.attach.path.based(
  item_path = "~/ws/lib-dfmmedia_scratch/metadata/user_cell_move_qgis_plugin___graph_covid_in_long_time_full___analyse___itemCreation___vsb___ccByNcNd___staticReport.png",

  item_primaryKey = "STATICRESOURCE#",
  item_sortKey = "CS#INTERNAL#EDUCATE#87dcee44-1650-4d22-abcc-25926ab9977a ... languagePrimary#authoriseAccount#objectMotivation#hashId",
  item_hashId = "HASH#d8dca795-e22a-4efc-b4ff-7eda96fcdb7b",

  #item_resource
  item_typeEnvironmentService = "type environment service",
  item_typeObjectDeliveryFormats = "widgetHtmlGraphDygraph",
  item_typeObjectDeliveryFormatsFlavours = "markdown__html4tags__toc",
  item_content = "data visualisation",
  item_hashIdCollection = "COLLECTION#d8dca795-e22a-4efc-b4ff-7eda96fcdb7b",
  item_SortKeyCollection = "SKCOLLECTION#d8dca795-e22a-4efc-b4ff-7eda96fcdb7b",
  item_descriptionCollection="what the collection is about",

  #item_location
  item_location_typeEnvironmentService = "s3",
  item_location_account = "182059100462",
  item_location_bucket = "vsbcda-dantec-com-intite-rst-infdev-s3e-182059100462",
  item_location_key = "documentation___887244e4-0ab2-466b-a0e8-0a5cd71b9ab3/template___internal___3b80283b-fc27-4489-8b54-8c87c6136997/rdmformats__html_clean__toc/template.html",
  
  item_languagePrimary = "en",
  
  #item_nameSpace = list_namespace,
  
  item_nameSpace_type = "relative",
  item_nameSpace_destination = "atlMob", 
  item_nameSpace_value = "/mobilita",
  
  item_publishDefault = "lab_danse_tech",

  #item_about
  item_titleOptions_full_cs = "Šablona generování stránek",
  item_titleOptions_full_en = "Template for pages rendering",
  item_titleOptions_short_cs = "sablona",
  item_titleOptions_short_en = "template",
  item_description_full_cs = "Toto je popis výstupu šablony, nikoliv kódu. Na základě vstupů `render.json` a podpůrných souborů vygeneruje objekt typu stránka.",
  item_description_full_en = "This is a description of the template output, not the code. It generates a page object based on `render.json` inputs and supporting files.",
  item_description_short_cs = "Popis výstupu šablony. `render.json`",
  item_description_short_en = "Description of the template output. `render.json`",
  item_keyword_cs = c("vektor","klicovych","slov"),
  item_keyword_en = c("vector","of","keywords"),
  item_organisation =  "VSB",
  item_owner = "vavral",
  item_creator = "Lukas Vavra",

  item_license_public = FALSE,

  item_tag = list_tag,

  #date
  item_date_validFrom = "2021-02-15T10:40:19.283Z",
  item_date_validTill = "2022-02-15T10:40:19.283Z",

  # item_legend = list_legend.ts
)
```

**Output:**
- a json file is stored to the same location as the media item

**Output file example**

- Fully Filled [here](https://github.com/Danse4mobility/lib-dfmmedia/blob/main/example_files/user_cell_move_qgis_plugin___graph_covid_in_long_time_full___analyse___itemCreation___vsb___ccByNcNd___staticReport.json) 
  - all parameters have been provided -> everything is filled
- Only parsed name (only necessary input parameters given) [here](https://github.com/Danse4mobility/lib-dfmmedia/blob/main/example_files/user_cell_move_qgis_plugin___graph_covid_in_long_time_not_full___analyse___itemCreation___vsb___ccByNcNd___staticReport.json)
  - only the item path was provided -> only parsed parameters are filled
- Bad naming (item not named properly) [here](https://github.com/Danse4mobility/lib-dfmmedia/blob/main/example_files/user_cell_move_qgis_plugin__graph_covid_in_long_time_bad_naming___analyse___itemCreation___vsb___ccByNcNd___staticReport.json)
  - name that does not following nameing rules was provided -> everything except for parsed parameters was filled
