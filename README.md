
## lib-dfmmetadata

lib[rary]-[]d[anse]f[or]m[obility]metadata

### TODO

1. continue with dynamo db cataloque item upload, boto3
5. replicate to usecases (objects)
7. sync to s3 with **basic policy attachment**
9. "lock" tag object for rewrite. If metadata exist for object, force edit, merge, rather than rewrite
13. library / extension vscode, implement scheme to .jsonc validator

### Consider

https://github.com/Danse4mobility/d4m-sck-manpro/blob/master/chapter_90__documentation.Rmd

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

![how_to_create_media](https://github.com/Danse4mobility/lib-dfmmetadata/blob/master/attachments/lib_dfmmedia___how_to_create_media___help___itemCreation___vsb___by_nc_nd___StaticResource.PNG?raw=true)

https://github.com/Danse4mobility/lib-dfmmetadata/blob/master/attachments/lib_dfmmedia___how_to_create_media___help___itemCreation___vsb___by_nc_nd___StaticResource.PNG

### Governing methods

https://code.visualstudio.com/docs/languages/json

replace comment regex `\/\*.*\*\/`

## Manipulate me

**Updates and locations**

Stack is updated locally, `vscode` prefered.

**render me**

Recommended methods to preview .md file 

`R -e "rmarkdown::render('$HOME/ws/lib-dfmmetadata/README.md', output_file = '$HOME/ws/lib-dfmmetadata/README.html')"`

`pandoc chapter_01__original.Rmd -t html -o chapter_01__original.html`

To generate mermaid, https://mermaid-js.github.io/mermaid-live-editor/

keep .mmd or .md source, generate .png, .svg version.

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

## List of functions

1) metadata.attach.path.based

## 1) metadata.attach.path.based (last update 2021-09-03)
This function generates a json file of item metadata. 

- Function throws an error if the item at the given path does not exist (ERROR: FILE DOES NOT EXIST).
- TBA: Function throws an error if the item is not named according to the rules above (ERROR: FILE NOT NAMED PROPERLY).
- TBA: Function looks for a json file that carries legend of the item. If found the legend json file is merged to the output metadata json file.
	- Example of a legend json file created by a function from lib-dfmmedia is - [here]()
	- Proper name of the legend json file required - example: The media item is named mediaitem.png. The function will look for a json file named mediaitem___legend.json

### Input parameters:

EACH PARAMETER EXCEPT FOR item_path CAN BE OMITTED!

Default value for an omittable parameter is "xxx"

If not stated differently, following parameters are string

- item_path          
  - path where the item is stored
- item_primaryKey                     
  - primary key identificator
- item_sortKey                     
  - sort key identificator
- item_hashId
  - hashID identificator
- item_typeEnvironmentService
  - parameter of resource section
- item_typeObjectDeliveryFormats
  - parameter of resource section
- item_content
  - parameter of resource section
- item_hashIdCollection
  - parameter of resource section - hashID identificator of the collection
- item_SortKeyCollection
  - parameter of resource section - sort key of the collection
- item_descriptionCollection
  - parameter of resource section - description of the collection
- item_location_typeEnvironmentService
  - parameter of location section - type of storage
- item_location_account
  - parameter of location section
- item_location_bucket
  - parameter of location section
- item_location_key
  - parameter of location section
- item_languagePrimary
  - language of the item
- item_nameSpace_type
  - parameter of namespace section
- item_nameSpace_destination
  - parameter of namespace section
- item_nameSpace_value
  - parameter of namespace section
- item_publishDefault
	- TBA  
- item_titleOptions_full_cs
  - parameter of about section - title in cz
- item_titleOptions_full_en
  - parameter of about section - title in en
- item_titleOptions_short_cs
  - parameter of about section - short title in cz
- item_titleOptions_short_en
  - parameter of about section - short title in en
- item_description_full_cs
  - parameter of about section - description in cz
- item_description_full_en
  - parameter of about section - description in en
- item_description_short_cs
  - parameter of about section - short description in cz      
- item_description_short_en
  - parameter of about section - short description in en
- item_organisation
  - parameter of about section - organisation that created the item
- item_owner
  - parameter of about section - owner of the item
- item_creator
  - parameter of about section - creator of the item
- item_keyword_cs
  - parameter of about section - keywords in cz - vector
- item_keyword_en
  - parameter of about section - keywords in en - vector
- item_license_public
  - parameter of about section - is the item public? - bool
- item_date_validFrom
  - parameter of date section - from when the item is valid
- item_date_validTill
  - parameter of date section - until when the item is valid
- item_tag
  - tags - list 

### EXAMPLE of use

```
list_tag = list()
  list_tag["key1"] = "value1"
  list_tag["key2"] = "value2"
```

```text
metadata.attach.path.based(
  item_path = "~/ws/lib-dfmmedia_scratch/metadata/user_cell_move_qgis_plugin___graph_covid_in_long_time_full___analyse___itemCreation___vsb___ccByNcNd___staticReport.png",

  item_primaryKey = "STATICRESOURCE#",
  
  item_sortKey = "CS#INTERNAL#EDUCATE#87dcee44-1650-4d22-abcc-25926ab9977a ... languagePrimary#authoriseAccount#objectMotivation#hashId",
  
  item_hashId = "HASH#d8dca795-e22a-4efc-b4ff-7eda96fcdb7b",

  #resource
  item_typeEnvironmentService = "type environment service",
  item_typeObjectDeliveryFormats = "widgetHtmlGraphDygraph",
  item_typeObjectDeliveryFormatsFlavours = "markdown__html4tags__toc",
  item_content = "data visualisation",
  item_hashIdCollection = "COLLECTION#d8dca795-e22a-4efc-b4ff-7eda96fcdb7b",
  item_SortKeyCollection = "SKCOLLECTION#d8dca795-e22a-4efc-b4ff-7eda96fcdb7b",
  item_descriptionCollection="what the collection is about",

  #location
  item_location_typeEnvironmentService = "s3",
  item_location_account = "182059100462",
  item_location_bucket = "vsbcda-dantec-com-intite-rst-infdev-s3e-182059100462",
  item_location_key = "documentation___887244e4-0ab2-466b-a0e8-0a5cd71b9ab3/template___internal___3b80283b-fc27-4489-8b54-8c87c6136997/rdmformats__html_clean__toc/template.html",
  
  item_languagePrimary = "en",
  
  #namespace  
  item_nameSpace_type = "relative",
  item_nameSpace_destination = "atlMob", 
  item_nameSpace_value = "/mobilita",
  
  item_publishDefault = "lab_danse_tech",

  #about
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
  item_date_validTill = "2022-02-15T10:40:19.283Z"
)
```

**Output:**

- a json file is stored to the same location as the media item

**Output file example**
TBA: This example shows the output json file in case everything was provided and a legend json file was found and thus is included - [here]() 

**Other possible outputs**

TBA: This example shows the output json file in case a legend json file was not found thus is not included - [here]()

TBA: This example shows the output json file in case only item_path was provided - [here]()



