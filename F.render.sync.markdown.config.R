# system ---

Sys.setenv(RSTUDIO_PANDOC="/usr/lib/rstudio-server/bin/pandoc")  

# agrs

args = commandArgs(trailingOnly = TRUE)
print (args)

args_sync = args[1]

# settings ---

par_set_aws_profile_1 = "default"
input="~/lib-dfmrender/001_chapter__how_to_render.Rmd"
output_format="rmdformats::html_clean"

# source config file ---

title = "template render rmarkdown"
creator = "Jiří Hylmar"
author = creator
typeEnvironmentService = "s3"
account = "182059100462"
bucket = "vsbcda-dantec-com-intite-rst-infdev-s3e-182059100462"
key1 = "428d63f9-9d82-4d63-950f-562c2f9ce97e__management"
key2 = "libdfmmetadata__e7979f37-e623-4010-b2af-f2abf01659d4"

# obtain basename with snippet SYNTmediaSchemaMaskDocument
basename = "libdfmmetadata___001_chapter__how_to_render__en___intite___manage___itemCreation___vsb___copyright___StaticResource___htmlDocument___rmdhtmcletoc___b3a10519-588d-4412-8ac6-d9641d63d7a4___mediaSchemaMaskDocument.html"

key = paste0 (key1,"/",key2,"/",basename)
subtitle = gsub (basename,"",key)

# compose settings from config json ---

syncLocation = paste0(
  typeEnvironmentService
  ,"://"
  ,bucket
  ,"/"
  ,key
)

syncLocation = gsub (basename,"",syncLocation)

output_dir = paste0(
  "~/lib-dfmrender/scratch/"
  ,gsub (basename,"",key)
)

intermediates_dir = paste0(
    output_dir
    ,gsub("\\.*","",basename)
    )

output_file = paste0(
    output_dir
    ,basename
    )

dir.create(
  file.path(
    dirname(
      intermediates_dir
    )
  )
  ,recursive = TRUE
  ,showWarnings = FALSE
)


# execute ----

rmarkdown::render(
  
  input = input
  ,output_format = output_format
  ,output_dir = output_dir
  ,intermediates_dir = intermediates_dir
  ,output_file = output_file
  ,params = list(
    title = title
    ,subtitle = subtitle
    ,author = author
  )  
  ,clean = FALSE
  
)

# sync ----

if (args_sync == 1){
  files.from = output_dir
  files.to = syncLocation

  transfer.jobs =  paste0(
    'aws s3 --profile '
    ,par_set_aws_profile_1
    ,' sync '
    ,files.from
    ," "
    ,files.to
  )

  system(transfer.jobs[1])

  }else if(args_sync == 0){

    print ("pars set to no sync")

}
