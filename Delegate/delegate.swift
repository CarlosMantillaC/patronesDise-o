protocol DownloadDelegate {
    
    func didFinishDownload()
}

class Downloader {
    
    var delegate: DownloadDelegate?
    
    func fileDownload() {
        
        print("Iniciando Descarga...")
        delegate?.didFinishDownload()
    }
}

class DownloadView: DownloadDelegate {
    
    func didFinishDownload() {
        print("Descarga Completada")
    }
}

let view = DownloadView()

let downloader = Downloader()

downloader.delegate = view

downloader.fileDownload()
