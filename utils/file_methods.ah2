#Requires AutoHotkey v2.0


class FileMethods {
    /**
     * @description `GetParentDir`
     * Get the parent directory (of a specified path).
     * 
     * NOTE: The path can be either the path of a file or the path of a directory.
     * 
     * @param {(String)} [path]
     * The path from which you want to get the parent directory.
     * 
     * @returns {(String)}
     * The parent directory.
     */
    static GetParentDir(path) {
        pathElements := StrSplit(path, ["\", "/"])
        pathElements.RemoveAt(-1)

        parentDir := ""
        for element in pathElements {
            parentDir .= element . "\"
        }
        
        return parentDir
    }

    /**
     * @description `GetProjectDir`
     * Get the main project directory (searching for a specific file).
     * 
     * NOTE: The method returns an empty string if the file does not exist.
     * 
     * @param {(String)} [filename]
     * Name of the file to search.
     * 
     * @returns {(String)}
     * Project directory.
     */
    static GetProjectDir(filename) {
        dir := A_ScriptDir
        while DirExist(dir) {
            OutputDebug dir

            if (FileExist(dir "\" filename))
                return dir
        
            parent := this.GetParentDir(dir)

            if (!InStr(parent, "\"))  ; We are at the root of the drive (e.g. parent = "C:")
                break

            dir := parent
        }

        return ""
    }
}
