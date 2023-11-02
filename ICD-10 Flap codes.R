# Flap coding
flapList1 <- c("0HX5XZZ", "0HX6XZZ", "0HX7XZZ", "0HX8XZZ", "0HXAXZZ", "0HXBXZZ", 
               "0HXCXZZ", "0HXDXZZ", "0HXEXZZ", "0HXFXZZ", "0HXGXZZ", "0HXHXZZ",
               "0HXJXZZ", "0HXKXZZ", "0HXLXZZ", "0HXMXZZ", "0HXNXZZ")

flaplist2 <- c("0JX60ZB", "0JX60ZC", "0JX63ZB", "0JX63ZC", "0JX70ZB", "0JX70ZC",
               "0JX73ZB", "0JX73ZC", "0JX80ZB", "0JX80ZC", "0JX83ZB", "0JX83ZC",
               "0JX90ZB", "0JX90ZC","0JX93ZB", "0JX93ZC", "0JXB0ZB", "0JXB0ZC",
               "0JXB3ZB", "0JXB3ZC", "0JXC0ZB", "0JXC0ZC", "0JXC3ZB", "0JXC3ZC",
               "0JXD0ZB", "0JXD0ZC", "0JXD3ZB", "0JXD3ZC", "0JXF0ZB", "0JXF0ZC",
               "0JXF3ZB", "0JXF3ZC", "0JXG0ZB", "0JXG0ZC", "0JXG3ZB", "0JXG3ZC",
               "0JXH0ZB", "0JXH0ZC", "0JXH3ZB", "0JXH3ZC", "0JXL0ZB", "0JXL0ZC",
               "0JXL3ZB", "0JXL3ZC", "0JXM0ZB", "0JXM0ZC", "0JXM3ZB", "0JXM3ZC",
               "0JXN0ZB", "0JXN0ZC", "0JXN3ZB", "0JXN3ZC", "0JXP0ZB", "0JXP0ZC",
               "0JXP3ZB", "0JXP3ZC", "0JXQ0ZB", "0JXQ0ZC", "0JXQ3ZB", "0JXQ3ZC", 
               "0JXR0ZB", "0JXR0ZC", "0JXR3ZB", "0JXR3ZC")

diagnosticCM <- c("S72.90XB", "S72.90XC", "S72.309B", "S72.309C", "S72.409B",
                  "S72.409C", "S72.413B", "S72.413C", "S72.416B", "S72.416C", 
                  "S72.443B", "S72.443C", "S72.446B", "S72.446C", "S72.453B", 
                  "S72.453C", "S72.456B", "S72.456C", "S72.499B", "S72.499C", 
                  "S82.109B", "S82.109C", "S82.839B", "S82.839C", "S82.101B", 
                  "S82.831B", "S82.102B", "S82.832B", "S82.209B", "S82.209C", 
                  "S82.409B", "S82.409C", "S82.201B", "S82.401B", "S82.202B",
                  "S82.402B", "S82.201C", "S82.401C", "S92.819B", "S92.909B",
                  "S92.109B", "S92.253B", "S92.256B", "S92.213B", "S92.216B",
                  "S92.223B", "S92.226B", "S92.233B", "S92.236B", "S92.243B",
                  "S92.246B", "S92.309B", "S99.109B", "S99.119B", "S99.129B",
                  "S99.139B", "S99.149B", "S99.199B", "S92.201B", "S92.202B",
                  "S92.209B", "S92.201B", "S92.301B", "S92.202B", "S92.302B",
                  "S42.209B", "S42.309B", "S42.409B", "S52.90XB", "S52.90XC",
                  "S52.90XB", "S52.90XC", "S62.109B", "S62.309B", "S62.509B",
                  "S62.609B", "S41.009A", "S51.809A")

## Procedure Codes

scapula <- c("0PH504Z", "0PH534Z", "0PH544Z", "0PH604Z", "0PH634Z", "0PH644Z")

glenoid <- c("0PH704Z", "0PH734Z", "0PH744Z", "0PH804Z", "0PH834Z", "0PH844Z")

clavicle <- c("0PH904Z", "0PH934Z", "0PH944Z", "0PHB04Z", "0PHB34Z", "0PHB44Z")

humeralHead <- c("0PHC04Z", "0PHC05Z", "0PHC06Z", "0PHC08Z", "0PHC0BZ", 
                 "0PHC0CZ", "0PHC0DZ", "0PHC34Z", "0PHC35Z", "0PHC36Z",
                 "0PHC38Z", "0PHC3BZ", "0PHC3CZ", "0PHC3DZ", "0PHC44Z",
                 "0PHC45Z", "0PHC46Z", "0PHC48Z", "0PHC4BZ", "0PHC4CZ",
                 "0PHC4DZ", "0PHD04Z", "0PHD05Z", "0PHD06Z", "0PHD0BZ",
                 "0PHD0CZ", "0PHD0DZ", "0PHD34Z", "0PHD35Z", "0PHD36Z", 
                 "0PHD38Z", "0PHD3BZ", "0PHD3CZ", "0PHD3DZ", "0PHD44Z", 
                 "0PHD45Z", "0PHD46Z", "0PHD48Z", "0PHD4BZ", "0PHD4CZ",
                 "0PHD4DZ")

humeralShaft <- c("0PHF04Z", "0PHF05Z", "0PHF06Z", "0PHF07Z", "0PHF08Z",
                  "0PHF0BZ", "0PHF0CZ", "0PHF0DZ", "0PHF34Z", "0PHF35Z",
                  "0PHF36Z", "0PHF37Z", "0PHF38Z", "0PHF3BZ", "0PHF3CZ", 
                  "0PHF3DZ", "0PHF44Z", "0PHF45Z", "0PHF46Z", "0PHF47Z", 
                  "0PHF48Z", "0PHF4BZ", "0PHF4CZ", "0PHF4DZ", "0PHG04Z", 
                  "0PHG05Z", "0PHG06Z", "0PHG07Z", "0PHG08Z", "0PHG0BZ", 
                  "0PHG0CZ", "0PHG0DZ", "0PHG34Z", "0PHG35Z", "0PHG36Z", 
                  "0PHG37Z", "0PHG38Z", "0PHG3BZ", "0PHG3CZ", "0PHG3DZ", 
                  "0PHG44Z", "0PHG45Z", "0PHG46Z", "0PHG47Z", "0PHG48Z", 
                  "0PHG4BZ", "0PHG4CZ", "0PHG4DZ")

radius <- c("0PHH04Z", "0PHH05Z", "0PHH06Z", "0PHH08Z", "0PHH0BZ", "0PHH0CZ", 
            "0PHH0DZ", "0PHH34Z", "0PHH35Z", "0PHH36Z", "0PHH38Z", "0PHH3BZ", 
            "0PHH3CZ", "0PHH3DZ", "0PHH44Z", "0PHH45Z", "0PHH46Z", "0PHH48Z", 
            "0PHH4BZ", "0PHH4CZ", "0PHH4DZ", "0PHJ04Z", "0PHJ05Z", "0PHJ06Z", 
            "0PHJ08Z", "0PHJ0BZ", "0PHJ0CZ", "0PHJ0DZ", "0PHJ34Z", "0PHJ35Z", 
            "0PHJ36Z", "0PHJ38Z", "0PHJ3BZ", "0PHJ3CZ", "0PHJ3DZ", "0PHJ44Z", 
            "0PHJ45Z", "0PHJ46Z", "0PHJ48Z", "0PHJ4BZ", "0PHJ4CZ", "0PHJ4DZ")

ulna <- c("0PHK04Z", "0PHK05Z", "0PHK06Z", "0PHK08Z", "0PHK0BZ", "0PHK0CZ", 
          "0PHK0DZ", "0PHK34Z", "0PHK35Z", "0PHK36Z", "0PHK38Z", "0PHK3BZ", 
          "0PHK3CZ", "0PHK3DZ", "0PHK44Z", "0PHK45Z", "0PHK46Z", "0PHK48Z", 
          "0PHK4BZ", "0PHK4CZ", "0PHK4DZ", "0PHL04Z", "0PHL05Z", "0PHL06Z", 
          "0PHL08Z", "0PHL0BZ", "0PHL0CZ", "0PHL0DZ", "0PHL34Z", "0PHL35Z", 
          "0PHL36Z", "0PHL38Z", "0PHL3BZ", "0PHL3CZ", "0PHL3DZ", "0PHL44Z", 
          "0PHL45Z", "0PHL46Z", "0PHL48Z", "0PHL4BZ", "0PHL4CZ", "0PHL4DZ")

carpalBone <- c("0PHM04Z", "0PHM05Z", "0PHM34Z", "0PHM35Z", "0PHM44Z", 
                "0PHM45Z", "0PHN04Z", "0PHN05Z", "0PHN34Z", "0PHN35Z", 
                "0PHN44Z", "0PHN45Z")

metacarpal <- c("0PHP04Z", "0PHP05Z", "0PHP34Z", "0PHP35Z", "0PHP44Z", 
                "0PHP45Z", "0PHQ04Z", '0PHQ05Z', "0PHQ34Z", "0PHQ35Z", 
                "0PHQ44Z", "0PHQ45Z")

thumb <- c("0PHR04Z", "0PHR05Z", "0PHR34Z", "0PHR35Z", "0PHR44Z", 
           "0PHR45Z", "0PHS04Z", "0PHS05Z", "0PHS34Z", "0PHS35Z", 
           "0PHS44Z", "0PHS45Z")

phalanx <- c("0PHT04Z", "0PHT05Z", "0PHT34Z", "0PHT35Z", "0PHT44Z", 
             "0PHT45Z", "0PHV04Z", "0PHV05Z", "0PHV34Z", "0PHV35Z", 
             "0PHV44Z", "0PHV45Z")

femur <- c("0QH604Z", "0QH605Z", "0QH606Z", "0QH608Z", "0QH60BZ", 
           "0QH60CZ", "0QH60DZ", "0QH634Z", "0QH635Z", "0QH636Z", 
           "0QH638Z", "0QH63BZ", "0QH63CZ", "0QH63DZ", "0QH644Z", 
           "0QH645Z", "0QH646Z", "0QH648Z", "0QH64BZ", "0QH64CZ", 
           "0QH64DZ", "0QH704Z", "0QH705Z", "0QH706Z", "0QH708Z", 
           "0QH70BZ", "0QH70CZ", "0QH70DZ", "0QH734Z", "0QH735Z", 
           "0QH736Z", "0QH738Z", "0QH73BZ", "0QH73CZ", "0QH73DZ", 
           "0QH744Z", "0QH745Z", "0QH746Z", "0QH748Z", "0QH74BZ", 
           "0QH74CZ", "0QH74DZ", "0QH804Z", "0QH805Z", "0QH806Z", 
           "0QH807Z", "0QH808Z", "0QH80BZ", "0QH80CZ", "0QH80DZ", 
           "0QH834Z", "0QH835Z", "0QH836Z", "0QH837Z", "0QH838Z", 
           "0QH83BZ", "0QH83CZ", "0QH83DZ", "0QH844Z", "0QH845Z", 
           "0QH846Z", "0QH847Z", "0QH848Z", "0QH84BZ", "0QH84CZ", 
           "0QH84DZ", "0QH904Z", "0QH905Z", "0QH906Z", "0QH907Z", 
           "0QH908Z", "0QH90BZ", "0QH90CZ", "0QH90DZ", "0QH934Z", 
           "0QH935Z", "0QH936Z", "0QH937Z", "0QH938Z", "0QH93BZ",
           "0QH93CZ", "0QH93DZ", "0QH944Z", "0QH945Z", "0QH946Z",
           "0QH947Z", "0QH948Z", "0QH94BZ", "0QH94CZ", "0QH94DZ",
           "0QHB04Z", "0QHB05Z", "0QHB06Z", "0QHB08Z", "0QHB0BZ", 
           "0QHB0CZ", "0QHB0DZ", "0QHB34Z", "0QHB35Z", "0QHB36Z",
           "0QHB38Z", "0QHB3BZ", "0QHB3CZ", "0QHB3DZ", "0QHB44Z",
           "0QHB45Z", "0QHB46Z", "0QHB48Z", "0QHB4BZ", "0QHB4CZ",
           "0QHB4DZ", "0QHC04Z", "0QHC05Z", "0QHC06Z", "0QHC08Z",
           "0QHC0BZ", "0QHC0CZ", "0QHC0DZ", "0QHC34Z", "0QHC35Z",
           "0QHC36Z", "0QHC38Z", "0QHC3BZ", "0QHC3CZ", "0QHC3DZ",
           "0QHC44Z", "0QHC45Z", "0QHC46Z", "0QHC48Z", "0QHC4BZ",
           "0QHC4CZ", "0QHC4DZ")

patella <- c("0QHD04Z", "0QHD05Z", "0QHD34Z", "0QHD35Z", "0QHD44Z",
             "0QHD45Z", "0QHF04Z", "0QHF05Z", "0QHF34Z", "0QHF35Z",
             "0QHF44Z", "0QHF45Z")

tibia <- c("0QHG04Z", "0QHG05Z", "0QHG06Z", "0QHG07Z","0QHG08Z", 
           "0QHG0BZ", "0QHG0CZ", "0QHG0DZ", "0QHG34Z", "0QHG35Z",
           "0QHG36Z", "0QHG37Z", "0QHG38Z", "0QHG3BZ", "0QHG3CZ",
           "0QHG3DZ", "0QHG44Z", "0QHG45Z", "0QHG46Z", "0QHG47Z",
           "0QHG48Z", "0QHG4BZ", "0QHG4CZ", "0QHG4DZ", "0QHH04Z",
           "0QHH05Z", "0QHH06Z", "0QHH07Z", "0QHH08Z", "0QHH0BZ",
           "0QHH0CZ", "0QHH0DZ", "0QHH34Z", "0QHH35Z", "0QHH36Z",
           "0QHH37Z", "0QHH38Z", "0QHH3BZ", "0QHH3CZ", "0QHH3DZ",
           "0QHH44Z", "0QHH45Z", "0QHH46Z", "0QHH47Z", "0QHH48Z",
           "0QHH4BZ", "0QHH4CZ", "0QHH4DZ")

fibula <- c("0QHJ04Z", "0QHJ05Z", "0QHJ06Z", "0QHJ08Z", "0QHJ0BZ",
            "0QHJ0CZ", "0QHJ0DZ", "0QHJ34Z", "0QHJ35Z", "0QHJ36Z",
            "0QHJ38Z", "0QHJ3BZ", "0QHJ3CZ", "0QHJ3DZ", "0QHJ44Z",
            "0QHJ45Z", "0QHJ46Z", "0QHJ48Z", "0QHJ4BZ", "0QHJ4CZ",
            "0QHJ4DZ", "0QHK04Z", "0QHK05Z", "0QHK06Z", "0QHK08Z",
            "0QHK0BZ", "0QHK0CZ", "0QHK0DZ", "0QHK34Z", "0QHK35Z",
            "0QHK36Z", "0QHK38Z", "0QHK3BZ", "0QHK3CZ", "0QHK3DZ",
            "0QHK44Z", "0QHK45Z", "0QHK46Z", "0QHK48Z", "0QHK4BZ",
            "0QHK4CZ", "0QHK4DZ")

tarsal <- c("0QHL04Z", "0QHL05Z", "0QHL34Z", "0QHL35Z", "0QHL44Z", 
            "0QHL45Z", "0QHM04Z", "0QHM05Z", "0QHM34Z", "0QHM35Z",
            "0QHM44Z", "0QHM45Z")

metatarsal <- c("0QHN04Z", "0QHN05Z", "0QHN34Z", "0QHN35Z", "0QHN44Z",
                "0QHN45Z", "0QHP04Z", "0QHP05Z", "0QHP34Z", "0QHP35Z",
                "0QHP44Z", "0QHP45Z")

toe <- c("0QHQ04Z",  "0QHQ05Z", "0QHQ34Z", "0QHQ35Z", "0QHQ44Z", 
         "0QHQ45Z", "0QHR04Z", "0QHR05Z", "0QHR34Z", "0QHR35Z", 
         "0QHR44Z", "0QHR45Z")
