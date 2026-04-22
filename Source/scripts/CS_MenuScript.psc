Scriptname CS_MenuScript

Function ShowMenu(FormList MenuList, float afArg1 = 0.0, float afArg2 = 0.0, float afArg3 = 0.0, float afArg4 = 0.0, float afArg5 = 0.0, \
    float afArg6 = 0.0, float afArg7 = 0.0, float afArg8 = 0.0, float afArg9 = 0.0) global
    int Response = (MenuList.GetAt(0) as Message).show(afArg1, afArg2, afArg3, afArg4, afArg5, afArg6, afArg7, afArg8, afArg9)
EndFunction