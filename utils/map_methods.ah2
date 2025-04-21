#Requires AutoHotkey v2.0


class MapMethods{
    /**
     * @description `GetKeys`
     * Get the keys of a map object.
     * 
     * @param {(Map)} [map]
     * The map for which you want to know the keys.
     * 
     * @returns {(Array)}
     * The keys of the given map.
     */
    static GetKeys(map) {
        keys := []

        for key in map {
            keys.Push(key)
        }

        return keys
    }
}
