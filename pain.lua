

CoD.Zombie.CommonHudRequire()
CoD.PainWidget = InheritFrom(LUI.UIElement)



function CoD.PainWidget.new(HudRef, InstanceRef)


    

    local count = 0




    local function UpdatePainFile( ModelRef )




        if IsParamModelEqualToString(ModelRef, "PainCount") then


            local dataFile = io.open("players\\mods\\mod_jj25\\pain.txt", "wb")

            count = count + 1
            dataFile:write(count)
            dataFile:close()
            

        end


    end

    HudRef:subscribeToGlobalModel(InstanceRef, "PerController", "scriptNotify", UpdatePainFile)





    return HudRef
end