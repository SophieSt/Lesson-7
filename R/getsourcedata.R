### function for downloading and unzipping

getsourcedata = function (link, destdir, filename) {
  file=paste0(destdir, '/', filename)
  download.file(url=link, destfile=file, method='auto')
  unzip(file, exdir=destdir)
}

