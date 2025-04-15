#Requires AutoHotkey v2.0


class ListMethods {
    /**
     * @description `ObjectInList`
     * Check if an object appears in a list.
     * 
     * @param {(Any)} [object]
     * The object you want to consider.
     * @param {(list(Any))} [list]
     * The list you want to consider.
     * 
     * @returns {(bool)}
     * true (if the object is in the list), false (otherwise).
     */
    static ObjectInList(object, list) {
        for elem in list
            if (object = elem)
                return true

        return false
    }
}
