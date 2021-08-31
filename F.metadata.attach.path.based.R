metadata.attach.path.based = function(item_path,
                                      
                                      item_primaryKey = "xxx",
                                      
                                      item_sortKey = "xxx",
                                      
                                      item_hashId = "xxx",
                                      
                                      #item_resource
                                      item_typeEnvironmentService = "xxx",
                                      item_typeObjectDeliveryFormats = "xxx",
                                      item_typeObjectDeliveryFormatsFlavours = "xxx",
                                      item_content = "xxx",
                                      item_hashIdCollection = "xxx",
                                      item_SortKeyCollection = "xxx",
                                      item_descriptionCollection ="xxx",
                                      
                                      item_subtitle = "xxx",
                                      
                                      item_location = "xxx",
                                      item_location_typeEnvironmentService = "xxx",
                                      item_location_account = "xxx",
                                      item_location_bucket = "xxx",
                                      item_location_key = "xxx",
                                      
                                      item_languagePrimary = "xxx",
                                      
                                      item_nameSpace = "xxx",
                                      item_nameSpace_type = "xxx",
                                      item_nameSpace_destination = "xxx",
                                      item_nameSpace_value = "xxx",
                                      
                                      item_publishDefault = "xxx",
                                      
                                      #item_about
                                      item_titleOptions_full_cs = "xxx",
                                      item_titleOptions_full_en = "xxx",
                                      item_titleOptions_short_cs = "xxx",
                                      item_titleOptions_short_en = "xxx",
                                      item_description_full_cs = "xxx",
                                      item_description_full_en = "xxx",
                                      item_description_short_cs = "xxx",
                                      item_description_short_en = "xxx",
                                      item_organisation = "xxx",
                                      item_owner = "xxx",
                                      item_creator = "xxx",
                                      item_keyword_cs = "xxx",
                                      item_keyword_en = "xxx",
                                      item_license_public = "xxx",
                                      item_license = "xxx",
                                      
                                      item_tag = "xxx",
                                      
                                      #item_date
                                      item_date_validFrom = "xxx",
                                      item_date_validTill = "xxx",
                                      
                                      item_legend = "xxx"){
  
  # existence-of-the-item check ----
  if(!file.exists(path.expand(item_path))) {stop("FILE DOES NOT EXIST",call. = TRUE)}

  
  ### AUXILIARY PARAMETERS and JOBS__________________________________====

  item_path = path.expand(item_path)
 
  item_name = basename(item_path)
  
  item_name_sans_ext = tools::file_path_sans_ext(item_name)
  
  item_name_parsed = strsplit(item_name_sans_ext,"___")
  
  locate_uuid = stringi::stri_locate(item_path,regex="([a-f0-9])+-([a-f0-9])+-([a-f0-9])+-([a-f0-9])+-([a-f0-9]+)")
  
  out_path = paste0(tools::file_path_sans_ext(item_path),".json")
  
  type_of_item = substr(item_path,stringi::stri_locate_last(item_path,regex="[.]")[1]+1,nchar(item_path)) # png, html, docx, pdf ...
  
  is_properly_named = (length(item_name_parsed[[1]]) == 7)
  # ______________________________________________________====
  
  ### JOBS _______________________________________====
  
  # Simple parameters ____________________________ ----
  
  # parameters from item_name_parsed
  if(is_properly_named == TRUE){
    item_runner = item_name_parsed[[1]][1] 
    item_title = item_name_parsed[[1]][2]
    item_objectMotivation = item_name_parsed[[1]][3]
    item_accrualMethod = item_name_parsed[[1]][4]
    item_rightsHolder = item_name_parsed[[1]][5]
    item_license = item_name_parsed[[1]][6]
    item_typeObject = item_name_parsed[[1]][7]
  }
  else 
  {
    item_runner = "xxx"
    item_title = "xxx"
    item_objectMotivation = "xxx"
    item_accrualMethod = "xxx"
    item_rightsHolder = "xxx"
    item_license = "xxx"
    item_typeObject = "xxx"
  }

  runner = item_runner
  title = item_title
  objectMotivation = item_objectMotivation
  accrualMethod = item_accrualMethod
  rightsHolder = item_rightsHolder
  typeObject = item_typeObject
  license = item_license

  
  
  # other parameters
  primaryKey = item_primaryKey
  sortKey = item_sortKey
  languagePrimary = item_languagePrimary
  publishDefault = item_publishDefault  
  
  titleStandard = gsub(" ", "_",tolower(item_titleOptions_full_en))
  subtitle = item_subtitle
  
  if(nchar(item_hashId) > 0){
    hashId = item_hashId
  } else if(!is.na(locate_uuid[1])){
    sortKey = substr(item_path,locate_uuid[1],locate_uuid[2])
  }  else {
    hashId = item_hashId
  }
  
  # End simple parameters ____________________________ ----

  # Complex parameters ______________________________ ----
  
  # _tag ---- 
  tag = item_tag
  # _tag ready ---- 
  
  # _legendSettings ----
  legenda = item_legend
  # _legendSettings ready ----
  
  # _location ----
  location_key_split = strsplit(item_location_key,"/")[[1]]
  location = list()
    location["typeEnvironmentService"] = item_location_typeEnvironmentService
    location["account"] = item_location_account
    location["bucket"] = item_location_bucket
    location["key"] = item_location_key
    location["keys"] = as.data.frame(location_key_split)
    location["basename"] = location_key_split[length(location_key_split)]
  
  # _location ready_______----  
  
  # _namespace ___________ ----
  
  if (typeof(item_nameSpace) == "character"){
    nameSpace = list()
      nameSpace["type"] = item_nameSpace_type
      nameSpace["destination"] = item_nameSpace_destination
      nameSpace["value"] = item_nameSpace_value 
  }else
  { 
      nameSpace = item_nameSpace
  }
 
 
  # _namespace ready ___________ ----

  
  # _about ----
  titleOptions_full = list()
    titleOptions_full["cs"] = item_titleOptions_full_cs
    titleOptions_full["en"] = item_titleOptions_full_en
    
  titleOptions_short = list()
    titleOptions_short["cs"] = item_titleOptions_short_cs
    titleOptions_short["en"] = item_titleOptions_short_en
  
  titleOptions = list()
    titleOptions["full"] = list(titleOptions_full)
    titleOptions["short"] = list(titleOptions_short)
    
  
    
  description_full = list()
    description_full["cs"] = item_description_full_cs
    description_full["en"] = item_description_full_en
    
  description_short = list()
    description_short["cs"] = item_description_short_cs
    description_short["en"] = item_description_short_en
    
  description = list()
    description["full"] = list(description_full)
    description["short"] = list(description_short)
    
    
  keyword = list()
    keyword["cs"] = as.data.frame(item_keyword_cs)
    keyword["en"] = as.data.frame(item_keyword_en)
    
    
  license = list()
    license["public"] = item_license_public
    license["license"] = item_license
    
  
  about = list()
    about["titleOptions"] = list(titleOptions)
    about["description"] = list(description)
    about["keyword"] = list(keyword)
    about["owner"] = item_owner #substr(Sys.getenv("HOME"),stringi::stri_locate_last(Sys.getenv("HOME"),regex="[/]")+1,(Sys.getenv("HOME")))
    about["creator"] = item_creator
    about["rightsHolder"] = item_rightsHolder
    about["license"] = list(license)
    about["accrualMethod"] = accrualMethod
  # _about ready__________----
    
  # _date______________________----
  date = list()
      if(file.exists(out_path)){
        old_json = jsonlite::fromJSON(paste0(substr(item_path,1,stringi::stri_locate_last(item_path,regex="[.]")),"json"))
        date["created"] = old_json$date$created
      }else{
        date["created"] = format(Sys.time(),format="%Y-%m-%dT%H:%M:%SZ")
      }
      date["updated"] = format(Sys.time(),format="%Y-%m-%dT%H:%M:%SZ")
      
      
      foo_date_validFrom <- function() format(as.Date(item_date_validFrom),format="%Y-%m-%dT%H:%M:%SZ")
      foo_date_validFrom_ERROR <- function() item_date_validFrom
      
      date["validFrom"] <- tryCatch(
        {
          foo_date_validFrom()
        },
        error = function(e){
          foo_date_validFrom_ERROR()
        }
      )
      
      foo_date_validTill <- function() format(as.Date(item_date_validTill),format="%Y-%m-%dT%H:%M:%SZ")
      foo_date_validTill_ERROR <- function() item_date_validTill
      

      date["validTill"] <- tryCatch(
        {
          foo_date_validTill()
        },
        error = function(e){
          foo_date_validTill_ERROR()
        }
      )
      
      if(is.na(date["validFrom"])){
        date["validFrom"] = ""
      }
      if(is.na(date["validTill"])){
        date["validTill"] = ""
      }
  # _date ready__________----      
      
  #_ resource___________ ----
      
  collection = list()
   collection["hashIdCollection"] = item_hashIdCollection
   collection["sortKeyCollection"] = item_SortKeyCollection
   collection["descriptionCollection"] = item_descriptionCollection
      
      
  resource = list()
   resource["typeEnvironmentService"] = item_typeEnvironmentService
   resource["typeObjectDeliveryFormats"] = item_typeObjectDeliveryFormats
   resource["typeObjectDeliveryFormatsFlavours"] = item_typeObjectDeliveryFormatsFlavours
   resource["content"] = item_content
   resource["collection"] = list(collection)    
      
  # _resource ready _____----  

  
  # End complex parameters ______________________________----
  
  # create and fill dataframe ----
  df = data.frame(primaryKey = "",
                  sortKey = "",
                  hashId = "",
                  typeObject = "",
                  runner = "",
                  resource = "",
                  title = "",
                  titleStandard = "",
                  subtitle = "",
                  location = "",
                  languagePrimary = "",
                  objectMotivation = "",
                  nameSpace = "",
                  publishDefault = "",
                  about = "",
                  tag = "",
                  date = "")
  
  df$primaryKey = list(primaryKey)
  
  df$sortKey = sortKey
  
  df$hashId = hashId
  
  df$typeObject = typeObject
  
  df$runner = runner
  
  df$resource = list(resource)
  
  df$title = title
  
  df$titleStandard = titleStandard
  
  df$subtitle = subtitle
  
  if(typeof(location) == "character"){
    df$location = location
  }else{
    df$location = list(location)
  }
  
  df$languagePrimary = languagePrimary
  
  df$objectMotivation = objectMotivation
  
  df$nameSpace = list(nameSpace)
  
  df$publishDefault = publishDefault
  
  df$about = list(about)
  
  if(typeof(tag) == "character"){
    df$tag = tag
  }else{
    df$tag = list(tag)
  }
  
  df$date = data.frame(date)
  
  # legend included only if provided
  if(typeof(legenda) == "character"){
  }else{
    df$legendSettings = list(legenda)
  }
  

  # create and fill dataframe ready _______----
  
  # JOBS ready ______----
  
  # write json ----
  json_string = jsonlite::toJSON(df,
                                 pretty = TRUE,
                                 auto_unbox = FALSE
                                )
  
  write(json_string,
        file = paste0(out.nam.legend))
  
  # write json ready______----
  
}
### function ready_________________________====



