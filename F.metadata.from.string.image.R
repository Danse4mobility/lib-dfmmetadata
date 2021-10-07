# rstudioapi::getSourceEditorContext()$path
#  "~/ws/tem/F.metadata.attach.string.based.R"
# 2 inputs. Template, String
# output json metadata


# agrs

args = commandArgs(trailingOnly = TRUE)
inputString = args[1]

### ____________________________________________________====
### ENVIRONMENT ________________________________________====

require(configr)
require(stringi)
require(uuid)

'%!in%' <- function(x, y)
  ! ('%in%'(x, y))

### ____________________________________________________====
### PARAMETERS / ARGUMENTS _____________________________====

#_ arguments to get config file and version ----

envPath = "/home/hylmarj"
configFolder = "ws/tem"
configName = "data.json"

### ____________________________________________________====
### JOB _____________________________====

# parse config ----

#_ read in ----

configPath = "/home/rstudio/lib-dfmmetadata/jsonSchemas/danseDataCatalogueSchemaDefault.json"
configFile = read.config(configPath, file.type = 'json')

#_ parse structure ----

lst = configFile

lst.l1.names = names(lst$body)
lst.l1.lengths = as.vector( unlist (lapply(lst$body,function(x) length(x))))

#_ create control structures

lst.analysys = data.frame(
  leves = "l1"
  ,names = lst.l1.names
  ,lenghts = lst.l1.lengths
)

#__ separate lists,values and dataframes

separate.values = c(
  "primaryKey"
  ,"sortKey"
  ,"titleStandard" 
)

separate.lists = c(
  "locations"
  ,"publishing"
  ,"keywords"
  ,"tags"
  ,"transformations"
  ,"attachments"
)

F.separate.lists = function (tellme){
  result = lst$body[names(lst$body) %in% tellme == TRUE]
  assign(tellme,result,envir=.GlobalEnv)
}

for (i in seq_along(separate.lists)){
  F.separate.lists(separate.lists[i])
}

for (i in seq_along(separate.values)){
  F.separate.lists(separate.values[i])
}


lst.simple = lst$body[names(lst$body) %in% 
                        c(
                          separate.lists
                          ,separate.values
                        )== FALSE]


lst.unl = unlist(lst.simple, recursive = T)
lst.unl.nam = names(lst.unl)
lst.unl.nam.key = gsub("^.*\\.","",lst.unl.nam)

df.template = data.frame(
  keyOriginalJson = lst.unl.nam
  ,keyToFill = lst.unl.nam.key
  ,keyToFillOrd = seq(1, length(lst.unl.nam.key))
)

#_ from string fillable values ----
lst.names.to.fill = df.template$keyOriginalJson
lst.names.to.fill = lst.names.to.fill[!grepl("Anchor",lst.names.to.fill)]

cat(lst.names.to.fill,sep = "\n")
# except of subtitle - filled automatically
# except of titleNameSpace - map needed

# parse input string ----

inputString = "details.language_cs___details.objectMotivations_educate___details.license_copyright___details.creator_hylmarj___details.runners_libdfmmetadata___about.title.value_Použití porpůrných fukcí při tvorbě Mermaid diagramu___about.description.value_Typ výstupu mermaid je generován v sekvenci kroků `A` až `G`. Funkce `F.metadata.from.string.image.R` zajišuje doplnění metadat a přejmenování členů `Collection`, konkrétně souborů .mmd, .svg a .png."

inputStringSplit = strsplit(inputString,"___")
inputStringSplit = lapply(inputStringSplit, function(x) strsplit(x,"_"))
inputStringSplit = as.data.frame (do.call(rbind,inputStringSplit[[1]]))
colnames(inputStringSplit) = c("keyOriginalJson","value")

# merge template and input string ----

df.template.filled = merge(df.template,inputStringSplit,all.x = T)
df.template.filled = df.template.filled[order(df.template.filled$keyToFillOrd),]
df.template.filled[is.na(df.template.filled)]="xxx"


# compose autofill values ----
# fill in missing, replicate ----
exclude = df.template.filled$keyOriginalJson[grep("Anchor",df.template.filled$keyOriginalJson)]
df.template.filled.clean = as.data.frame (df.template.filled[df.template.filled$keyOriginalJson %!in% exclude, ])
#cat (df.template.filled.clean$keyOriginalJson,sep="\n")
rownames(df.template.filled.clean) = df.template.filled.clean$keyOriginalJson

df.template.filled.clean$a_collection = "xxx"
df.template.filled.clean$b_mmd = "xxx"
df.template.filled.clean$c_png = "xxx"
df.template.filled.clean$d_svg = "xxx"

# _execute insert ----

titleStandard$titleStandard = paste(tolower(as.vector(unlist(strsplit(iconv(unlist (
  in.str$about.title.value
),to="ASCII//TRANSLIT")," ")))), collapse = "_")

df.template.filled.clean[
  "details.runners"
  ,][c("a_collection","b_mmd","c_png","d_svg")] = c(
    "a"
    ,"b"
    ,"c"
    ,"d"
    )

in.str$details.runners
in.str$details.type ="Collection"
in.str$details.language
in.str$details.objectMotivations
in.str$details.accrualMethod = "itemCreation"
in.str$details.identifier = uuid::UUIDgenerate(1)
in.str$details.format
in.str$details.rightsholder = "vsb"
in.str$details.license = "copyright"
in.str$details.owner
in.str$details.creator
in.str$about.title.value
in.str$about.title.language = in.str$details.language
in.str$about.title.versions = "fullVersion"
in.str$about.subtitle.value = paste0(titleStandard$titleStandard," ",in.str$details.identifier)
in.str$about.subtitle.language = in.str$details.language
in.str$about.description.value
in.str$about.description.language = in.str$details.language
in.str$about.description.versions = "fullVersion"
in.str$about.titleNameSpace.value
in.str$about.titleNameSpace.language
in.str$about.titleNameSpace.versions
in.str$relations.format
in.str$relations.formatFlavours
relations.hasFormat = c("mmd","png","svg")
in.str$relations.isFormatOf
in.str$relations.versions
in.str$relations.hasVersion
in.str$relations.isVersionOf
in.str$relations.hasPart
in.str$relations.isPartOf
in.str$dates.created
in.str$dates.updated
in.str$dates.validFrom
in.str$dates.validTo
in.str$sustainability.isLockedForEditing
in.str$sustainability.isInitiated
in.str$sustainability.isLicensePublic


# eval parse text technique to populate json ----

#_ prepare address ----

keyString = df.template.filled$keyOriginalJson
#i=1; j=1

keyStringEval = list()

for (i in seq_along(keyString)){
  
  keyString_tmp = unlist (strsplit(keyString[i],"\\."))
  
  lst.keyString_tmp = list()
  for (j in seq_along(keyString_tmp)){
    lst.keyString_tmp[[j]] = paste0("[['",keyString_tmp[[j]],"']]")
  }
  
  lst.keyString_tmp = unlist(lst.keyString_tmp)
  lst.keyString_tmp = paste(lst.keyString_tmp,collapse = "")
  lst.keyString_tmp = paste0("lstOut",lst.keyString_tmp,collapse = "")
  keyStringEval[[i]] = lst.keyString_tmp
  
}

df.template.filled$keyString = as.vector(unlist(keyStringEval))

#_ assign new values to json ----

lstOut = lst

for (i in seq_along(df.template.filled$keyString)){
  
  fillIn = paste0(df.template.filled$keyString[i],"=",paste0("'",df.template.filled$value[i]),"'")
  eval(parse(text=fillIn))
  
}

names (lstOut) = "fileName"

jsonlite::toJSON(lstOut)

print (jsonlite::toJSON(lstOut,pretty = T))
