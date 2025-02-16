predict_m6a_benifit <- function(data, cancer) {


   if (!(cancer %in% c("ACC", "BLCA", "BRCA", "CESC", "COAD", "ESCA", "GBM", "HNSC", "KIRC", "KIRP",
                       "LGG", "LIHC", "LUAD", "LUSC", "MESO", "OV", "PAAD", "PCPG",
                       "PRAD", "READ", "SARC", "SKCM", "STAD", "TGCT", "THCA", "THYM", "UCEC", "UVM"))) {
      stop("Not within the optional cancer types, please input one of the following cancer types: ACC, BLCA, BRCA, CESC, COAD, ESCA, GBM, HNSC, KIRC, KIRP,
          LGG, LIHC, LUAD, LUSC, MESO, OV, PAAD, PCPG, PRAD, READ, SARC, SKCM, STAD, TGCT, THCA, THYM, UCEC or UVM")
   }


   suppressWarnings(library(grf))

   data.file <- system.file(file.path('extdata', paste0( cancer, ".Rds")), package="m6ADEinfer")

   modellcsf <- readRDS(data.file)

   matched_columns <- match(colnames(modellcsf$X.orig), colnames(data))


   result <- data.frame(matrix(NA, nrow = nrow(data), ncol = length(colnames(modellcsf$X.orig))))
   colnames(result) <- colnames(modellcsf$X.orig)


   for (i in seq_along(colnames(modellcsf$X.orig))) {
      if (!is.na(matched_columns[i])) {
         result[[colnames(modellcsf$X.orig)[i]]] <- data[[matched_columns[i]]]
      }
   }


   prediction <- predict(modellcsf, newdata = result)

   return(prediction)
}



