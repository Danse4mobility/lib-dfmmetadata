
## lib-dfmmetadata

lib[rary]-[]d[anse]f[or]m[obiltiy]metadata[]

### About me

I provide templates and keep them in a single place. I include functionalities to `create` and `organise` resources in `data catalog`

I do following task.

**A)** maintain [Media mask] `danseDataCatalogueSchemaDefault.jsonc` which is used to provide core structures for metadata of all objects

**B)** provide [Snippets template] `markdown.json` that includes snippets `SYNT.*SchemaMask` for creating `metadata` and to help auto-fill `danseDataCatalogueSchemaDefault.json` In two steps i. create string, ii. use this string to create *.json metadata for given object.

**C)** render mechanism for .mmd objects [Render diagram] with sync to s3 location.

**D)** json metadata from string [Metadata from string]

**E)** method of using metadata in case of [Create manual snapshot]

**F)** render mechanism for Rmarkdown documents [Render Rmarkdown documents]. **.gitignore** is set to `/scratch` so the documents rendered should be placed into this directory.

**G)** json metadata from string [Synchronise to s3 method]

#### Media mask

Once `danseDataCatalogueSchemaDefault.jsonc` make copy `danseDataCatalogueSchemaDefault.json` and replace comment regex ` \/\*.*\*\/`. Save.

#### Snippets template

**maintanance**

Copy from helper google sheet `HELP-META` <a href='https://docs.google.com/spreadsheets/d/1lX3IJQghVONkRTV5AROA427xJbExYvpBZZXGWEDBWlo/edit#gid=956920037' target='_blank'><span style='font-family:Times;font-style: italic;font-size:0.8em;'>Learn more</span></a> to `SYNTmediaSchemaMask` part of default snippets dir (vscode) /mnt/c/Users/jirih/AppData/Roaming/Code/User/snippets/markdown.json.

Copy this json snippets to this repo

cp /mnt/c/Users/jirih/AppData/Roaming/Code/User/snippets/markdown.json ~/lib-dfmmetadata/snippetsCopy/markdown.json

cp /mnt/c/Users/jirih/AppData/Roaming/Code/User/snippets/mmd.json.code-snippets ~/lib-dfmmetadata/snippetsCopy/mmd.json


**use**

Users of vscode can use template markdown.json by (vscode wsl example)

cp ~/lib-dfmmetadata/snippetsCopy/markdown.json /mnt/c/Users/*username*/AppData/Roaming/Code/User/snippets/markdown.json 

cp ~/lib-dfmmetadata/snippetsCopy/mmd.json /mnt/c/Users/*username*/AppData/Roaming/Code/User/snippets/mmd.json.code-snippets

#### Render diagram

**Prerequesties**

- mermaid cli <a href='https://github.com/mermaid-js/mermaid-cli' target='_blank'><span style='font-family:Times;font-style: italic;font-size:0.8em;'>Learn more</span>.</a>. mmdc --help

**use**

mkdir -p ../create_resources__media_items/ && cd ../create_resources__media_items/ && \
mmdc -i sourceFile.mmd \
-o destinationFile.png \
-t forest

### Metadata from string

vscode wsl example

once the file markdown.json is in place

1. hitting `<CTRL-Space>` will trigger snippet options.
2. start writing `synt..` and select option `SYNTmermaidSchemaMask`, complete with `<Tab>`
3. you will be prompted to fill in string example

```
runners define:
title define:
language vocabulary:
accessRights vocabulary:
objectMotivations vocabulary:
accrualMethod vocabulary:
rightsHolder vocabulary:
license vocabulary:
typesObject vocabulary:
typesObjectDeliveryFormats vocabulary:
typesObjectDeliveryFormatsFlavours vocabulary:
identifier define:
format vocabulary:
```
4. The string contains information key_value. Key is used to auto-populate `metadata`.json.

5. created string is input of the function `F.metadata.attach.string.based.R`

`runners_libdfdmmetadata___title_Generate media object string with snippet helper___language_en___accessRights_intite___objectMotivations_help___accrualMethod_itemCreation___rightsHolder_vsb___license_copyright___typesObject_expression___typesObjectDeliveryFormats_xxx___typesObjectDeliveryFormatsFlavours_xxx___identifier_e760d5fb-542e-4e46-af57-3e9176f5f7b0___format_mmd`

#### Create manual snapshot

#### Render Rmarkdown documents

**Prerequesties**

- AWS default account access. default account ~ 182059100462
- R base
- Pandoc

Template to render rmarkdown parges in various html formats, word format and pdf format, equip pages with metadata and plase them on aws s3 for future processing.

run `Rscript F.render.sync.markdown.config.R 0`

#### Synchronise to s3 method

aws s3 sync --profile default . s3://vsbcda-dandra-com-intite-sss-infdev-wfs-182059100462/06d91fc8-e7dd-40b9-ae5c-9fb8f5f71541__media_items/

### TODO

### Consider

### Manipulate me

**updates and locations**

Stack is updated locally on `zbook`.

**view me local**

**edit me**

code $HOME/ws/lib-dfmrender/

**list content**

cd $HOME/ws/lib-dfmrender; find $(pwd) -name .git -prune -o -name "*"
