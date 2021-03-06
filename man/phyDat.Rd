\name{phyDat}
\alias{phyDat}
\alias{as.AAbin.phyDat}
\alias{as.phyDat.DNAbin}
\alias{as.phyDat.alignment}
\alias{as.phyDat.character}
\alias{as.phyDat.data.frame}
\alias{as.phyDat.factor}
\alias{as.phyDat.matrix}
\alias{as.phyDat.MultipleAlignment}
\alias{as.MultipleAlignment}
\alias{as.MultipleAlignment.phyDat}
\alias{as.data.frame.phyDat}
\alias{as.character.phyDat}
\alias{as.DNAbin.phyDat}
\alias{read.phyDat}
\alias{write.phyDat}
\alias{allSitePattern}
\alias{as.phyDat}
\alias{subset.phyDat}
\alias{acgt2ry}
\alias{baseFreq}
\alias{cbind.phyDat}
\alias{c.phyDat}
\alias{unique.phyDat}
\alias{removeUndeterminedSites}
\alias{phyDat2alignment}
\alias{phyDat2MultipleAlignment}
\alias{image.phyDat}
\alias{dna2codon}
\alias{codon2dna}
\title{Conversion among Sequence Formats}
\description{
These functions transform several DNA formats into the \code{phyDat} format. 
\code{allSitePattern} generates an alignment of all possible site patterns.
}
\usage{
phyDat(data, type = "DNA", levels = NULL, return.index=TRUE, ...) 
read.phyDat(file, format="phylip", type="DNA", ...)
write.phyDat(x, file, format="phylip", colsep = "", nbcol=-1, ...)
\method{as.phyDat}{DNAbin}(x, ...)
\method{as.phyDat}{alignment}(x, type="DNA", ...)
\method{as.phyDat}{character}(x, ...)
\method{as.phyDat}{data.frame}(x, ...)
\method{as.phyDat}{factor}(x, ...)
\method{as.phyDat}{matrix}(x, ...)
\method{as.phyDat}{MultipleAlignment}(x, ...)
%\method{as.AAbin}{phyDat}(x, ...)
\method{as.character}{phyDat}(x, allLevels = TRUE, ...)
\method{as.data.frame}{phyDat}(x, ...)
\method{as.DNAbin}{phyDat}(x, ...)
\method{subset}{phyDat}(x, subset, select, site.pattern = TRUE, ...)
\method{unique}{phyDat}(x, incomparables = FALSE, identical = TRUE, ...)
phyDat2alignment(x)
allSitePattern(n, levels=c("a","c","g","t"), names=NULL)
acgt2ry(obj)
baseFreq(obj, freq=FALSE, all=FALSE, drop.unused.levels=FALSE)
dna2codon(x)
codon2dna(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{An object containing sequences.}
  \item{x}{An object containing sequences.}
  \item{type}{Type of sequences ("DNA", "AA", "CODON" or "USER").}
  \item{levels}{Level attributes.}
  \item{return.index}{If TRUE returns a index of the site patterns.}
  \item{file}{A file name.}
  \item{format}{File format of the sequence alignment (see details).
  Several popular formats are supported: "phylip", "interleaved", "sequential", "clustal", "fasta" or "nexus", or any unambiguous abbreviation of these. 
  }
  \item{colsep}{a character used to separate the columns (a single space by default).}
  \item{nbcol}{a numeric specifying the number of columns per row (-1 by default); may be negative implying that the nucleotides are printed on a single line.}
  \item{n}{Number of sequences.}
  \item{names}{Names of sequences.}
  \item{subset}{a subset of taxa.}
  \item{select}{a subset of characters.}
  \item{site.pattern}{select site pattern or sites.}
  \item{allLevels}{return original data.} 
  \item{obj}{as object of class phyDat}
  \item{freq}{logical, if 'TRUE', frequencies or counts are returned otherwise proportions}
  \item{all}{all a logical; if all = TRUE, all counts of bases, ambiguous codes, missing data, and alignment gaps are returned as defined in the contrast.}
  \item{drop.unused.levels}{logical, drop unused levels}  
  \item{incomparables}{for compatability with unique.}
  \item{identical}{if TRUE (default) sequences have to be identical, if FALSE sequences are considered 
  duplicates if distance between sequences is zero (happens frequently with ambiguous sites).}
  \item{...}{further arguments passed to or from other methods.}
}
\details{
If \code{type} "USER" a vector has to be give to \code{levels}.
For example c("a", "c", "g", "t", "-") would create a data object that  
can be used in phylogenetic analysis with gaps as fifth state.  
There is a more detailed example for specifying "USER" defined data 
formats in the vignette "phangorn-specials".  

\code{allSitePattern} returns all possible site patterns and can
be useful in simulation studies. For further details see the vignette 
phangorn-specials.  

\code{write.phyDat} calls the function write.dna or write.nexus.data and  
\code{read.phyDat} calls the function \code{read.dna}, \code{read.aa} or \code{read.nexus.data}
see for more details over there.
  
You may import data directly with \code{\link[ape]{read.dna}} or \code{\link[ape]{read.nexus.data}}
and convert the data to class phyDat. 

The generic function \code{c} can be used to to combine sequences and \code{unique} to get 
all unique sequences or unique haplotypes. 

\code{acgt2ry} converts a \code{phyDat} object of nucleotides into an binary ry-coded dataset.  
}
\value{
The functions return an object of class \code{phyDat}. 
}

\author{Klaus Schliep \email{klaus.schliep@gmail.com}}

\seealso{ \code{\link{DNAbin}}, \code{\link{as.DNAbin}}, \code{\link{read.dna}},  \code{\link{read.aa}}, \code{\link{read.nexus.data}} 
and the chapter 1 in the \code{vignette("phangorn-specials", package="phangorn")} 
and the example of \code{\link{pmlMix}} for the use of \code{allSitePattern}
}
\examples{
data(Laurasiatherian)
class(Laurasiatherian)
Laurasiatherian
baseFreq(Laurasiatherian)
baseFreq(Laurasiatherian, all=TRUE)
subset(Laurasiatherian, subset=1:5)
# transform into old ape format
LauraChar <- as.character(Laurasiatherian)
# and back 
Laura <- phyDat(LauraChar, return.index=TRUE)
all.equal(Laurasiatherian, Laura)
allSitePattern(5)
}
\keyword{cluster}
