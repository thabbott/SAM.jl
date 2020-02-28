"""
Calculate interface levels (zi(1:nz)) from cell center levels (z(1:nz-1))
Returns (zi, dz, dzw), where zi are interface level heights, dz are the
thickness of scalar cells, and dzw are the thickness of interface cells

Translated from SAM6.11.3 setgrid.f90
"""
function calc_zi(z)
    
    nz = length(z) + 1
    nzm = length(z)
    adzw = zeros(nz)
    adz = zeros(nzm)
    zi = zeros(nz)
    
    dz = 0.5*(z[1] + z[2])
    for k in 2:nzm
        adzw[k] = (z[k] - z[k-1])/dz
    end
    adzw[1] = 1
    adzw[nz] = adzw[nz-1]
    adz[1] = 1
    for k in 2:nzm-1
        adz[k] = 0.5*(z[k+1] - z[k-1])/dz
    end
    adz[nzm] = adzw[nzm]
    zi[1] = 0
    for k in 2:nz
        zi[k] = zi[k-1] + adz[k-1]*dz
    end
    return (zi, adz.*dz, adzw.*dz)

end
