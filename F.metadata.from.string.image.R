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

configPath = "/home/hylmarj/lib-dfmmetadata/jsonSchemas/mediaSchemaMask.json"
configFile = read.config(configPath, file.type = 'json')

#_ parse structure ----

lst = configFile
lst.unl = unlist(lst, recursive = T)
lst.unl.nam = names(lst.unl)
lst.unl.nam.key = gsub("^.*\\.","",lst.unl.nam)

df.template = data.frame(
  keyOriginalJson = lst.unl.nam
  ,keyToFill = lst.unl.nam.key
  ,keyToFillOrd = seq(1, length(lst.unl.nam.key))
)


# parse input string ----

#inputString = "runners_libdfdmmetadata___title_Generate media object string with snippet helper___language_en___accessRights_intite___objectMotivations_help___accrualMethod_itemCreation___rightsHolder_vsb___license_copyright___typesObject_expression___typesObjectDeliveryFormats_xxx___typesObjectDeliveryFormatsFlavours_xxx___identifier_e760d5fb-542e-4e46-af57-3e9176f5f7b0___format_mmd"

inputStringSplit = strsplit(inputString,"___")
inputStringSplit = lapply(inputStringSplit, function(x) strsplit(x,"_"))
inputStringSplit = as.data.frame (do.call(rbind,inputStringSplit[[1]]))
colnames(inputStringSplit) = c("keyToFill","value")

# merge template and input string ----

df.template.filled = merge(df.template,inputStringSplit,all.x = T)
df.template.filled = df.template.filled[order(df.template.filled$keyToFillOrd),]
df.template.filled[is.na(df.template.filled)]="xxx"

# compose autofill values ----

# `eval parse text` technique to populate json ----

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
