"""
Return a named tuple of thermodynamic constants
"""
function list_constants()
    return (
        cp = 1004.0,
        g = 9.81,
        Lv = 2.5104e6,
        Lf = 0.3336e6,
        Ls = Lv + Lf,
        R = 287.0,
        Rv = 461.0
    )
end

"""
Return a named tuple of unit conversions
"""
function list_units()
    return (
        day = 86400.0,
        hPa = 100.0,
        km = 1000.0,
    )
end
