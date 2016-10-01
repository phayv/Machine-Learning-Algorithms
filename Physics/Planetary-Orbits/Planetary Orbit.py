from visual import *

system = display(width = 500, height = 500, center = (0,5,0))

sun = sphere(pos = (0,0,0), radius = 100, color = color.yellow)
earth = sphere(pos = (200,0,0), radius = 10, color = color.blue\
               ,make_trail = True, trail_type = 'line')
#obviously not to scale because the ratio sun to earth is ~109

#assume sun doesnt move
earth.make_trail = True
earth.v = vector(0,-7.5,0)

for i in range(1000):
    rate(30)
    
    dist = (earth.x**2 + earth.y**2 + earth.z**2)**.5
    radial_vector = (sun.pos - earth.pos)/dist
    #the constant of mass of sun mass of earth and gamma we'll just say is 9000
    f_g = 9000*radial_vector/dist**2
    
    earth.v += f_g
    earth.pos += earth.v

    if dist <= sun.radius:
        break


