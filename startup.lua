local mon = peripheral.find("monitor")

mon.setTextScale(0.6)

if not mon then
    error("Monitor not found!")
end

function machSpeed(speed, soundSpeed)

    local precision = 100
    return math.floor(speed * precision / soundSpeed) / precision
end

while true do

    -- World coordinates
    local pose = sublevel.getLogicalPose()
    local pos = pose.position

    -- Engine output
    local engine = rs.getAnalogInput("top")

    -- Linear velocity
    local vel = sublevel.getLinearVelocity()

    -- Horizontal speed
    local speed = math.sqrt(vel.x^2 + vel.z^2)
    -- Fazemos pitagoras porque queremos a velocidade resultante dos eixos x e z (das coordenadas do minecraft)
    
    -- Vertical speed
    local vs = vel.y

    mon.setBackgroundColor(colors.black)
    mon.clear()

    -- HUD TITLE
    mon.setCursorPos(1,1)
    mon.setTextColor(colors.cyan)
    mon.write("== X-15 HUD ==")

    -- MACH SPEED
    mon.setCursorPos(1,3)
    mon.setTextColor(colors.green)
    mon.write("MACH ")
    mon.write(machSpeed(speed, 340))

    -- HORIZONTAL SPEED
    mon.setCursorPos(1,4)
    mon.setTextColor(colors.green)
    mon.write("A-SPEED ")
    mon.write(math.floor(speed))

    -- VERTICAL SPEED
    mon.setCursorPos(1,5)
    mon.setTextColor(colors.green)
    mon.write("V-SPEED ")
    mon.write(math.floor(vs))

    -- ALTITUDE
    mon.setCursorPos(1,6)
    mon.setTextColor(colors.green)
    mon.write("ALT ")
    mon.write(math.floor(pos.y))

    -- ENGINE OUTPUT
    mon.setCursorPos(1,8)
    mon.setTextColor(colors.green)
    mon.write("PWR ")
    mon.write(engine)

    -- X
    mon.setCursorPos(1,9)
    mon.setTextColor(colors.green)
    mon.write("X ")
    mon.write(math.floor(pos.x))

    -- Z
    mon.setCursorPos(1,10)
    mon.setTextColor(colors.green)
    mon.write("Z ")
    mon.write(math.floor(pos.z))

    sleep(0.1)
end