% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fst_table.R
\name{fst_table}
\alias{fst_table}
\title{Access a fst file like a regular data.table}
\usage{
fst_table(path, old_format = FALSE)
}
\arguments{
\item{path}{Path to a fst file}

\item{old_format}{Use \code{old_format = TRUE} when referencing a fst file that was created
with a fst package version lower than 0.8.0}
}
\value{
An object of class \code{fsttable}
}
\description{
Create a fsttable object that can be accessed like a regular data frame. This object
is just a reference to the actual data and requires only a small amount of memory.
When data is accessed, only the requested subset is read from file. This is possible
because the fst file format allows full random access (in columns and rows) to the stored
dataset.
}
\examples{
\dontrun{
# generate a sample fst file
path <- paste0(tempfile(), ".fst")
write_fst(iris, path)

# create a fsttable object that can be used as a data frame
ft <- fst(path)

# print head and tail
print(ft)

# select columns and rows
x <- ft[10:14, c("Petal.Width", "Species")]

# use the common list interface
ft[TRUE]
ft[c(TRUE, FALSE)]
ft[["Sepal.Length"]]
ft$Petal.Length

# use data frame generics
nrow(ft)
ncol(ft)
dim(ft)
dimnames(ft)
colnames(ft)
rownames(ft)
names(ft)
}
}
