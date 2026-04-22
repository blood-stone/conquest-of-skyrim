Scriptname CS_CommonFunctions extends Form Hidden 

int Function ShowMultiPageMessage(FormList MessageList, int EntryAmount, bool Selectable, Float afArg1=0.0, Float afArg2=0.0, Float afArg3=0.0, Float afArg4=0.0, Float afArg5=0.0, Float afArg6=0.0, Float afArg7=0.0, Float afArg8=0.0, Float afArg9=0.0) global
    int PageNum = 1
    int MaxPages = math.ceiling(EntryAmount as float/5) as int
    while PageNum > 0
        int Response = 0
        if PageNum == 1
            if PageNum < MaxPages
                Response = (MessageList.GetAt(5) as Message).Show(afArg1, afArg2, afArg3, afArg4, afArg5, afArg6, afArg7, afArg8, afArg9)
            
                if Selectable
                    if Response == 5
                        if MaxPages > 1
                            PageNum = 2
                        else
                            return -1
                        endif
                    elseif Response == 6
                        if MaxPages > 1
                            return -1
                        endif
                    else
                        return Response
                    endif
                else
                    if Response == 1
                        PageNum = 2
                    else
                        return -1
                    endif
                endif
            elseif PageNum >= MaxPages
                Response = (MessageList.GetAt(EntryAmount) as Message).Show(afArg1, afArg2, afArg3, afArg4, afArg5, afArg6, afArg7, afArg8, afArg9)
            
                if Selectable
                    if Response == EntryAmount
                        return -1
                    else
                        return Response
                    endif
                else
                    return -1
                endif
            endif
        elseif PageNum < MaxPages
            Response = (MessageList.GetAt(PageNum*5) as Message).Show(afArg1, afArg2, afArg3, afArg4, afArg5, afArg6, afArg7, afArg8, afArg9)
            
            if Selectable
                if Response == 0
                    PageNum -= 1
                elseif Response > 0 && Response < 6
                    return Response + (PageNum - 1)*5
                elseif Response == 6
                    PageNum += 1
                elseif Response == 7
                    return -1
                else
                    return Response
                endif
            else
                if Response == 0
                    PageNum -= 1
                elseif Response == 1
                    PageNum += 1
                else
                    return -1
                endif
            endif
        elseif PageNum == MaxPages
            Response = (MessageList.GetAt(EntryAmount) as Message).Show(afArg1, afArg2, afArg3, afArg4, afArg5, afArg6, afArg7, afArg8, afArg9)
            
            if Selectable
                if Response == 0
                    PageNum -= 1
                elseif Response > 0 && Response <= EntryAmount - (PageNum - 1)*5
                    return Response + (PageNum - 1)*5
                else
                    return -1
                endif
            else
                if Response == 0
                    PageNum -= 1
                else
                    return -1
                endif
            endif
        endif
    endwhile
EndFunction

int Function GetListMenuMaxPages(int EntryAmount) global
    return math.ceiling(EntryAmount as float/5) as int
EndFunction

Form[] Function ConvertFormListToFormArray(FormList List) global
    Form[] NewFormArray

    int NumItems = List.GetSize()
    NewFormArray = GetNewFormArray(NumItems)
    
    int i = 0
    while i < List.GetSize()
        NewFormArray[i] = List.GetAt(i) as Form
        i += 1
    endwhile
    
    return NewFormArray
EndFunction

Outfit[] Function ConvertFormListToOutfitArray(FormList List) global
    Outfit[] NewOutfitArray

    int NumItems = List.GetSize()
    NewOutfitArray = GetNewOutfitArray(NumItems)
    
    int i = 0
    while i < List.GetSize()
        NewOutfitArray[i] = List.GetAt(i) as Outfit
        i += 1
    endwhile
    
    return NewOutfitArray
EndFunction

Armor[] Function ConvertFormListToArmorArray(FormList List) global
    Armor[] NewArmorArray

    int NumItems = List.GetSize()
    NewArmorArray = GetNewArmorArray(NumItems)
    
    int i = 0
    while i < List.GetSize()
        NewArmorArray[i] = List.GetAt(i) as Armor
        i += 1
    endwhile
    
    return NewArmorArray
EndFunction

ObjectReference[] Function RemoveFromArray(ObjectReference Subtraction, ObjectReference[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    ObjectReference[] NewArray = GetNewArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
ObjectReference[] Function AddToArray(ObjectReference Addition, ObjectReference[] OldArray) global
    if !OldArray
        ObjectReference[] NewArray = new ObjectReference[1]
        NewArray[0] = Addition
        return NewArray
    endif
    int NewArrayLength = OldArray.Length + 1

    ObjectReference[] NewArray = GetNewArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

ObjectReference[] Function AddArrayToArray(ObjectReference[] Addition, ObjectReference[] OldArray, bool allowrepeats=true) global
    int NewArrayLength = OldArray.Length + Addition.Length
    
    ObjectReference[] NewArray = GetNewArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    if allowrepeats
        
        int NewArray_i = 0
        while i < NewArray.Length && NewArray_i < Addition.Length
            NewArray[i] = Addition[NewArray_i]
            i += 1
            NewArray_i += 1
        endwhile
        
    else
    
        int NewArray_i = 0
        while i < NewArray.Length && NewArray_i < Addition.Length
            if OldArray.Find(Addition[NewArray_i]) < 0
                NewArray[i] = Addition[NewArray_i]
                i += 1
            endif
            NewArray_i += 1
        endwhile
        
    endif
    
    return NewArray
EndFunction

ObjectReference[] Function RemoveArrayFromArray(ObjectReference[] Subtraction, ObjectReference[] OldArray) global
    int NewArrayLength = OldArray.Length - Subtraction.Length
    
    ObjectReference[] NewArray = GetNewArray(NewArrayLength)
    
    int i = 0
    int OldArray_i = 0
    while i < NewArray.Length
        if Subtraction.Find(OldArray[OldArray_i]) < 0
            NewArray[i] = OldArray[OldArray_i]
            i += 1
        endif
        OldArray_i += 1
    endwhile
    
    return NewArray
EndFunction

Function AddArrayToFormList(ObjectReference[] Array, FormList FormListToAddTo) global
    int i = 0
    while i < Array.Length
        FormListToAddTo.AddForm(Array[i])
        i += 1
    endwhile
EndFunction

Form[] Function RemoveFromFormArray(Form Subtraction, Form[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    Form[] NewArray = GetNewFormArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
Form[] Function AddToFormArray(Form Addition, Form[] OldArray) global
    int NewArrayLength = OldArray.Length + 1

    Form[] NewArray = GetNewFormArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

FormList[] Function RemoveFromFormListArray(FormList Subtraction, FormList[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    FormList[] NewArray = GetNewFormListArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
FormList[] Function AddToFormListArray(FormList Addition, FormList[] OldArray) global
    int NewArrayLength = OldArray.Length + 1

    FormList[] NewArray = GetNewFormListArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

MiscObject[] Function RemoveFromMiscObjectArray(MiscObject Subtraction, MiscObject[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    MiscObject[] NewArray = GetNewMiscObjectArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
MiscObject[] Function AddToMiscObjectArray(MiscObject Addition, MiscObject[] OldArray) global
    int NewArrayLength = OldArray.Length + 1

    MiscObject[] NewArray = GetNewMiscObjectArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

int[] Function RemoveFromintArray(int Subtraction, int[] OldintArray) global
    int SubtractionIndex = OldintArray.Find(Subtraction)
    if SubtractionIndex < 0
        return OldintArray
    endif

    int NewintArrayLength = OldintArray.Length - 1

    int[] NewintArray = GetNewintArray(NewintArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldintArray.Length
        if i != SubtractionIndex
            NewintArray[new_i] = OldintArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewintArray
EndFunction
    
int[] Function AddTointArray(int Addition, int[] OldintArray) global
    int NewintArrayLength = OldintArray.Length + 1

    int[] NewintArray = GetNewintArray(NewintArrayLength)
    
    int i = 0
    while i < OldintArray.Length
        NewintArray[i] = OldintArray[i]
        i += 1
    endwhile
    
    NewintArray[i] = Addition
    
    return NewintArray
EndFunction

ActorBase[] Function RemoveFromActorBaseArray(ActorBase Subtraction, ActorBase[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    ActorBase[] NewArray = GetNewActorBaseArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
ActorBase[] Function AddToActorBaseArray(ActorBase Addition, ActorBase[] OldArray) global
    int NewArrayLength = OldArray.Length + 1

    ActorBase[] NewArray = GetNewActorBaseArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

ActorBase[] Function AddMultipleToActorBaseArray(ActorBase[] Additions, ActorBase[] OldArray) global
    int NewArrayLength = OldArray.Length + Additions.Length

    ActorBase[] NewArray = GetNewActorBaseArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    int index = 0
    while index < Additions.Length
        NewArray[i] = Additions[index]
        index += 1
        i += 1
    endwhile
    
    return NewArray
EndFunction

Actor[] Function RemoveFromActorArray(Actor Subtraction, Actor[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    Actor[] NewArray = GetNewActorArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
Actor[] Function AddToActorArray(Actor Addition, Actor[] OldArray) global
    int NewArrayLength = OldArray.Length + 1

    Actor[] NewArray = GetNewActorArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

Armor[] Function RemoveFromArmorArray(Armor Subtraction, Armor[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    Armor[] NewArray = GetNewArmorArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
Armor[] Function AddToArmorArray(Armor Addition, Armor[] OldArray) global
    int NewArrayLength = OldArray.Length + 1

    Armor[] NewArray = GetNewArmorArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

Scene[] Function RemoveFromSceneArray(Scene Subtraction, Scene[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    Scene[] NewArray = GetNewSceneArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction

Quest[] Function RemoveFromQuestArray(Quest Subtraction, Quest[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    Quest[] NewArray = GetNewQuestArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
Quest[] Function AddToQuestArray(Quest Addition, Quest[] OldArray) global
    int NewArrayLength = OldArray.Length + 1

    Quest[] NewArray = GetNewQuestArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

Ammo[] Function RemoveFromAmmoArray(Ammo Subtraction, Ammo[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    Ammo[] NewArray = GetNewAmmoArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
Ammo[] Function AddToAmmoArray(Ammo Addition, Ammo[] OldArray) global
    int NewArrayLength = OldArray.Length + 1

    Ammo[] NewArray = GetNewAmmoArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

ObjectReference[] Function GetNewArray(int ArraySize) global
    ObjectReference[] NewArray

    if ArraySize == 1
        NewArray = new ObjectReference[1]
    elseif ArraySize == 2
        NewArray = new ObjectReference[2]
    elseif ArraySize == 3
        NewArray = new ObjectReference[3]
    elseif ArraySize == 4
        NewArray = new ObjectReference[4]
    elseif ArraySize == 5
        NewArray = new ObjectReference[5]
    elseif ArraySize == 6
        NewArray = new ObjectReference[6]
    elseif ArraySize == 7
        NewArray = new ObjectReference[7]
    elseif ArraySize == 8
        NewArray = new ObjectReference[8]
    elseif ArraySize == 9
        NewArray = new ObjectReference[9]
    elseif ArraySize == 10
        NewArray = new ObjectReference[10]
    elseif ArraySize == 11
        NewArray = new ObjectReference[11]
    elseif ArraySize == 12
        NewArray = new ObjectReference[12]
    elseif ArraySize == 13
        NewArray = new ObjectReference[13]
    elseif ArraySize == 14
        NewArray = new ObjectReference[14]
    elseif ArraySize == 15
        NewArray = new ObjectReference[15]
    elseif ArraySize == 16
        NewArray = new ObjectReference[16]
    elseif ArraySize == 17
        NewArray = new ObjectReference[17]
    elseif ArraySize == 18
        NewArray = new ObjectReference[18]
    elseif ArraySize == 19
        NewArray = new ObjectReference[19]
    elseif ArraySize == 20
        NewArray = new ObjectReference[20]
    elseif ArraySize == 21
        NewArray = new ObjectReference[21]
    elseif ArraySize == 22
        NewArray = new ObjectReference[22]
    elseif ArraySize == 23
        NewArray = new ObjectReference[23]
    elseif ArraySize == 24
        NewArray = new ObjectReference[24]
    elseif ArraySize == 25
        NewArray = new ObjectReference[25]
    elseif ArraySize == 26
        NewArray = new ObjectReference[26]
    elseif ArraySize == 27
        NewArray = new ObjectReference[27]
    elseif ArraySize == 28
        NewArray = new ObjectReference[28]
    elseif ArraySize == 29
        NewArray = new ObjectReference[29]
    elseif ArraySize == 30
        NewArray = new ObjectReference[30]
    elseif ArraySize == 31
        NewArray = new ObjectReference[31]
    elseif ArraySize == 32
        NewArray = new ObjectReference[32]
    elseif ArraySize == 33
        NewArray = new ObjectReference[33]
    elseif ArraySize == 34
        NewArray = new ObjectReference[34]
    elseif ArraySize == 35
        NewArray = new ObjectReference[35]
    elseif ArraySize == 36
        NewArray = new ObjectReference[36]
    elseif ArraySize == 37
        NewArray = new ObjectReference[37]
    elseif ArraySize == 38
        NewArray = new ObjectReference[38]
    elseif ArraySize == 39
        NewArray = new ObjectReference[39]
    elseif ArraySize == 40
        NewArray = new ObjectReference[40]
    endif
    
    return NewArray
EndFunction

Form[] Function GetNewFormArray(int ArraySize) global
    Form[] NewArray

    if ArraySize == 1
        NewArray = new Form[1]
    elseif ArraySize == 2
        NewArray = new Form[2]
    elseif ArraySize == 3
        NewArray = new Form[3]
    elseif ArraySize == 4
        NewArray = new Form[4]
    elseif ArraySize == 5
        NewArray = new Form[5]
    elseif ArraySize == 6
        NewArray = new Form[6]
    elseif ArraySize == 7
        NewArray = new Form[7]
    elseif ArraySize == 8
        NewArray = new Form[8]
    elseif ArraySize == 9
        NewArray = new Form[9]
    elseif ArraySize == 10
        NewArray = new Form[10]
    elseif ArraySize == 11
        NewArray = new Form[11]
    elseif ArraySize == 12
        NewArray = new Form[12]
    elseif ArraySize == 13
        NewArray = new Form[13]
    elseif ArraySize == 14
        NewArray = new Form[14]
    elseif ArraySize == 15
        NewArray = new Form[15]
    elseif ArraySize == 16
        NewArray = new Form[16]
    elseif ArraySize == 17
        NewArray = new Form[17]
    elseif ArraySize == 18
        NewArray = new Form[18]
    elseif ArraySize == 19
        NewArray = new Form[19]
    elseif ArraySize == 20
        NewArray = new Form[20]
    elseif ArraySize == 21
        NewArray = new Form[21]
    elseif ArraySize == 22
        NewArray = new Form[22]
    elseif ArraySize == 23
        NewArray = new Form[23]
    elseif ArraySize == 24
        NewArray = new Form[24]
    elseif ArraySize == 25
        NewArray = new Form[25]
    elseif ArraySize == 26
        NewArray = new Form[26]
    elseif ArraySize == 27
        NewArray = new Form[27]
    elseif ArraySize == 28
        NewArray = new Form[28]
    elseif ArraySize == 29
        NewArray = new Form[29]
    elseif ArraySize == 30
        NewArray = new Form[30]
    endif
    
    return NewArray
EndFunction

FormList[] Function GetNewFormListArray(int ArraySize) global
    FormList[] NewArray

    if ArraySize == 1
        NewArray = new FormList[1]
    elseif ArraySize == 2
        NewArray = new FormList[2]
    elseif ArraySize == 3
        NewArray = new FormList[3]
    elseif ArraySize == 4
        NewArray = new FormList[4]
    elseif ArraySize == 5
        NewArray = new FormList[5]
    elseif ArraySize == 6
        NewArray = new FormList[6]
    elseif ArraySize == 7
        NewArray = new FormList[7]
    elseif ArraySize == 8
        NewArray = new FormList[8]
    elseif ArraySize == 9
        NewArray = new FormList[9]
    elseif ArraySize == 10
        NewArray = new FormList[10]
    elseif ArraySize == 11
        NewArray = new FormList[11]
    elseif ArraySize == 12
        NewArray = new FormList[12]
    elseif ArraySize == 13
        NewArray = new FormList[13]
    elseif ArraySize == 14
        NewArray = new FormList[14]
    elseif ArraySize == 15
        NewArray = new FormList[15]
    elseif ArraySize == 16
        NewArray = new FormList[16]
    elseif ArraySize == 17
        NewArray = new FormList[17]
    elseif ArraySize == 18
        NewArray = new FormList[18]
    elseif ArraySize == 19
        NewArray = new FormList[19]
    elseif ArraySize == 20
        NewArray = new FormList[20]
    endif
    
    return NewArray
EndFunction

MiscObject[] Function GetNewMiscObjectArray(int ArraySize) global
    MiscObject[] NewArray

    if ArraySize == 1
        NewArray = new MiscObject[1]
    elseif ArraySize == 2
        NewArray = new MiscObject[2]
    elseif ArraySize == 3
        NewArray = new MiscObject[3]
    elseif ArraySize == 4
        NewArray = new MiscObject[4]
    elseif ArraySize == 5
        NewArray = new MiscObject[5]
    elseif ArraySize == 6
        NewArray = new MiscObject[6]
    elseif ArraySize == 7
        NewArray = new MiscObject[7]
    elseif ArraySize == 8
        NewArray = new MiscObject[8]
    elseif ArraySize == 9
        NewArray = new MiscObject[9]
    elseif ArraySize == 10
        NewArray = new MiscObject[10]
    elseif ArraySize == 11
        NewArray = new MiscObject[11]
    elseif ArraySize == 12
        NewArray = new MiscObject[12]
    elseif ArraySize == 13
        NewArray = new MiscObject[13]
    elseif ArraySize == 14
        NewArray = new MiscObject[14]
    elseif ArraySize == 15
        NewArray = new MiscObject[15]
    elseif ArraySize == 16
        NewArray = new MiscObject[16]
    elseif ArraySize == 17
        NewArray = new MiscObject[17]
    elseif ArraySize == 18
        NewArray = new MiscObject[18]
    elseif ArraySize == 19
        NewArray = new MiscObject[19]
    elseif ArraySize == 20
        NewArray = new MiscObject[20]
    endif
    
    return NewArray
EndFunction

Actor[] Function GetNewActorArray(int ArraySize) global
    Actor[] NewArray

    if ArraySize == 1
        NewArray = new Actor[1]
    elseif ArraySize == 2
        NewArray = new Actor[2]
    elseif ArraySize == 3
        NewArray = new Actor[3]
    elseif ArraySize == 4
        NewArray = new Actor[4]
    elseif ArraySize == 5
        NewArray = new Actor[5]
    elseif ArraySize == 6
        NewArray = new Actor[6]
    elseif ArraySize == 7
        NewArray = new Actor[7]
    elseif ArraySize == 8
        NewArray = new Actor[8]
    elseif ArraySize == 9
        NewArray = new Actor[9]
    elseif ArraySize == 10
        NewArray = new Actor[10]
    elseif ArraySize == 11
        NewArray = new Actor[11]
    elseif ArraySize == 12
        NewArray = new Actor[12]
    elseif ArraySize == 13
        NewArray = new Actor[13]
    elseif ArraySize == 14
        NewArray = new Actor[14]
    elseif ArraySize == 15
        NewArray = new Actor[15]
    elseif ArraySize == 16
        NewArray = new Actor[16]
    elseif ArraySize == 17
        NewArray = new Actor[17]
    elseif ArraySize == 18
        NewArray = new Actor[18]
    elseif ArraySize == 19
        NewArray = new Actor[19]
    elseif ArraySize == 20
        NewArray = new Actor[20]
    endif
    
    return NewArray
EndFunction

Armor[] Function GetNewArmorArray(int ArraySize) global
    Armor[] NewArray

    if ArraySize == 1
        NewArray = new Armor[1]
    elseif ArraySize == 2
        NewArray = new Armor[2]
    elseif ArraySize == 3
        NewArray = new Armor[3]
    elseif ArraySize == 4
        NewArray = new Armor[4]
    elseif ArraySize == 5
        NewArray = new Armor[5]
    elseif ArraySize == 6
        NewArray = new Armor[6]
    elseif ArraySize == 7
        NewArray = new Armor[7]
    elseif ArraySize == 8
        NewArray = new Armor[8]
    elseif ArraySize == 9
        NewArray = new Armor[9]
    elseif ArraySize == 10
        NewArray = new Armor[10]
    elseif ArraySize == 11
        NewArray = new Armor[11]
    elseif ArraySize == 12
        NewArray = new Armor[12]
    elseif ArraySize == 13
        NewArray = new Armor[13]
    elseif ArraySize == 14
        NewArray = new Armor[14]
    elseif ArraySize == 15
        NewArray = new Armor[15]
    elseif ArraySize == 16
        NewArray = new Armor[16]
    elseif ArraySize == 17
        NewArray = new Armor[17]
    elseif ArraySize == 18
        NewArray = new Armor[18]
    elseif ArraySize == 19
        NewArray = new Armor[19]
    elseif ArraySize == 20
        NewArray = new Armor[20]
    endif
    
    return NewArray
EndFunction

ActorBase[] Function GetNewActorBaseArray(int ArraySize) global
    ActorBase[] NewArray

    if ArraySize == 1
        NewArray = new ActorBase[1]
    elseif ArraySize == 2
        NewArray = new ActorBase[2]
    elseif ArraySize == 3
        NewArray = new ActorBase[3]
    elseif ArraySize == 4
        NewArray = new ActorBase[4]
    elseif ArraySize == 5
        NewArray = new ActorBase[5]
    elseif ArraySize == 6
        NewArray = new ActorBase[6]
    elseif ArraySize == 7
        NewArray = new ActorBase[7]
    elseif ArraySize == 8
        NewArray = new ActorBase[8]
    elseif ArraySize == 9
        NewArray = new ActorBase[9]
    elseif ArraySize == 10
        NewArray = new ActorBase[10]
    elseif ArraySize == 11
        NewArray = new ActorBase[11]
    elseif ArraySize == 12
        NewArray = new ActorBase[12]
    elseif ArraySize == 13
        NewArray = new ActorBase[13]
    elseif ArraySize == 14
        NewArray = new ActorBase[14]
    elseif ArraySize == 15
        NewArray = new ActorBase[15]
    elseif ArraySize == 16
        NewArray = new ActorBase[16]
    elseif ArraySize == 17
        NewArray = new ActorBase[17]
    elseif ArraySize == 18
        NewArray = new ActorBase[18]
    elseif ArraySize == 19
        NewArray = new ActorBase[19]
    elseif ArraySize == 20
        NewArray = new ActorBase[20]
    endif
    
    return NewArray
EndFunction

int[] Function GetNewIntArray(int ArraySize) global
    int[] NewArray

    if ArraySize == 1
        NewArray = new int[1]
    elseif ArraySize == 2
        NewArray = new int[2]
    elseif ArraySize == 3
        NewArray = new int[3]
    elseif ArraySize == 4
        NewArray = new int[4]
    elseif ArraySize == 5
        NewArray = new int[5]
    elseif ArraySize == 6
        NewArray = new int[6]
    elseif ArraySize == 7
        NewArray = new int[7]
    elseif ArraySize == 8
        NewArray = new int[8]
    elseif ArraySize == 9
        NewArray = new int[9]
    elseif ArraySize == 10
        NewArray = new int[10]
    elseif ArraySize == 11
        NewArray = new int[11]
    elseif ArraySize == 12
        NewArray = new int[12]
    elseif ArraySize == 13
        NewArray = new int[13]
    elseif ArraySize == 14
        NewArray = new int[14]
    elseif ArraySize == 15
        NewArray = new int[15]
    elseif ArraySize == 16
        NewArray = new int[16]
    elseif ArraySize == 17
        NewArray = new int[17]
    elseif ArraySize == 18
        NewArray = new int[18]
    elseif ArraySize == 19
        NewArray = new int[19]
    elseif ArraySize == 20
        NewArray = new int[20]
    endif
    
    return NewArray
EndFunction

Outfit[] Function GetNewOutfitArray(int ArraySize) global
    Outfit[] NewArray

    if ArraySize == 1
        NewArray = new Outfit[1]
    elseif ArraySize == 2
        NewArray = new Outfit[2]
    elseif ArraySize == 3
        NewArray = new Outfit[3]
    elseif ArraySize == 4
        NewArray = new Outfit[4]
    elseif ArraySize == 5
        NewArray = new Outfit[5]
    elseif ArraySize == 6
        NewArray = new Outfit[6]
    elseif ArraySize == 7
        NewArray = new Outfit[7]
    elseif ArraySize == 8
        NewArray = new Outfit[8]
    elseif ArraySize == 9
        NewArray = new Outfit[9]
    elseif ArraySize == 10
        NewArray = new Outfit[10]
    elseif ArraySize == 11
        NewArray = new Outfit[11]
    elseif ArraySize == 12
        NewArray = new Outfit[12]
    elseif ArraySize == 13
        NewArray = new Outfit[13]
    elseif ArraySize == 14
        NewArray = new Outfit[14]
    elseif ArraySize == 15
        NewArray = new Outfit[15]
    elseif ArraySize == 16
        NewArray = new Outfit[16]
    elseif ArraySize == 17
        NewArray = new Outfit[17]
    elseif ArraySize == 18
        NewArray = new Outfit[18]
    elseif ArraySize == 19
        NewArray = new Outfit[19]
    elseif ArraySize == 20
        NewArray = new Outfit[20]
    endif
    
    return NewArray
EndFunction

Scene[] Function GetNewSceneArray(int ArraySize) global
    Scene[] NewArray

    if ArraySize == 1
        NewArray = new Scene[1]
    elseif ArraySize == 2
        NewArray = new Scene[2]
    elseif ArraySize == 3
        NewArray = new Scene[3]
    elseif ArraySize == 4
        NewArray = new Scene[4]
    elseif ArraySize == 5
        NewArray = new Scene[5]
    elseif ArraySize == 6
        NewArray = new Scene[6]
    elseif ArraySize == 7
        NewArray = new Scene[7]
    elseif ArraySize == 8
        NewArray = new Scene[8]
    elseif ArraySize == 9
        NewArray = new Scene[9]
    elseif ArraySize == 10
        NewArray = new Scene[10]
    elseif ArraySize == 11
        NewArray = new Scene[11]
    elseif ArraySize == 12
        NewArray = new Scene[12]
    elseif ArraySize == 13
        NewArray = new Scene[13]
    elseif ArraySize == 14
        NewArray = new Scene[14]
    elseif ArraySize == 15
        NewArray = new Scene[15]
    elseif ArraySize == 16
        NewArray = new Scene[16]
    elseif ArraySize == 17
        NewArray = new Scene[17]
    elseif ArraySize == 18
        NewArray = new Scene[18]
    elseif ArraySize == 19
        NewArray = new Scene[19]
    elseif ArraySize == 20
        NewArray = new Scene[20]
    endif
    
    return NewArray
EndFunction

Quest[] Function GetNewQuestArray(int ArraySize) global
    Quest[] NewArray

    if ArraySize == 1
        NewArray = new Quest[1]
    elseif ArraySize == 2
        NewArray = new Quest[2]
    elseif ArraySize == 3
        NewArray = new Quest[3]
    elseif ArraySize == 4
        NewArray = new Quest[4]
    elseif ArraySize == 5
        NewArray = new Quest[5]
    elseif ArraySize == 6
        NewArray = new Quest[6]
    elseif ArraySize == 7
        NewArray = new Quest[7]
    elseif ArraySize == 8
        NewArray = new Quest[8]
    elseif ArraySize == 9
        NewArray = new Quest[9]
    elseif ArraySize == 10
        NewArray = new Quest[10]
    elseif ArraySize == 11
        NewArray = new Quest[11]
    elseif ArraySize == 12
        NewArray = new Quest[12]
    elseif ArraySize == 13
        NewArray = new Quest[13]
    elseif ArraySize == 14
        NewArray = new Quest[14]
    elseif ArraySize == 15
        NewArray = new Quest[15]
    elseif ArraySize == 16
        NewArray = new Quest[16]
    elseif ArraySize == 17
        NewArray = new Quest[17]
    elseif ArraySize == 18
        NewArray = new Quest[18]
    elseif ArraySize == 19
        NewArray = new Quest[19]
    elseif ArraySize == 20
        NewArray = new Quest[20]
    endif
    
    return NewArray
EndFunction

Ammo[] Function GetNewAmmoArray(int ArraySize) global
    Ammo[] NewArray

    if ArraySize == 1
        NewArray = new Ammo[1]
    elseif ArraySize == 2
        NewArray = new Ammo[2]
    elseif ArraySize == 3
        NewArray = new Ammo[3]
    elseif ArraySize == 4
        NewArray = new Ammo[4]
    elseif ArraySize == 5
        NewArray = new Ammo[5]
    elseif ArraySize == 6
        NewArray = new Ammo[6]
    elseif ArraySize == 7
        NewArray = new Ammo[7]
    elseif ArraySize == 8
        NewArray = new Ammo[8]
    elseif ArraySize == 9
        NewArray = new Ammo[9]
    elseif ArraySize == 10
        NewArray = new Ammo[10]
    elseif ArraySize == 11
        NewArray = new Ammo[11]
    elseif ArraySize == 12
        NewArray = new Ammo[12]
    elseif ArraySize == 13
        NewArray = new Ammo[13]
    elseif ArraySize == 14
        NewArray = new Ammo[14]
    elseif ArraySize == 15
        NewArray = new Ammo[15]
    elseif ArraySize == 16
        NewArray = new Ammo[16]
    elseif ArraySize == 17
        NewArray = new Ammo[17]
    elseif ArraySize == 18
        NewArray = new Ammo[18]
    elseif ArraySize == 19
        NewArray = new Ammo[19]
    elseif ArraySize == 20
        NewArray = new Ammo[20]
    endif
    
    return NewArray
EndFunction

Actor[] Function ConvertRefAliasArrayToActors(ReferenceAlias[] Aliases) global
    Actor[] ActorArray
    
    int i = 0
    while i < Aliases.Length
        if Aliases[i].GetActorRef()
            ActorArray = AddToActorArray(Aliases[i].GetActorRef(), ActorArray)
        endif
        i += 1
    endwhile
    
    return ActorArray
EndFunction

Function AddActorsToAliasArray(Actor[] ActorArray, ReferenceAlias[] AliasArray) global
    int actornum = 0
    int aliasnum = 0
    while actornum < ActorArray.Length && aliasnum < AliasArray.Length
        if ActorArray[actornum]
            AliasArray[aliasnum].ForceRefTo(ActorArray[actornum])
            aliasnum += 1
        endif
        actornum += 1
    endwhile
EndFunction

int[] Function SortDescendingAndGetIndices(Int[] arr)
    Int n = arr.Length
    Bool swapped
    Int temp
    Int[] indices = GetNewIntArray(n)

    ; Initialize the indices array
    Int i = 0
    While i < n
        indices[i] = i
        i += 1
    EndWhile

    ; Sort the array by values, but swap indices accordingly
    swapped = False
    While swapped   
        i = 0
        While i < n - 1
            If arr[i] < arr[i + 1]
                ; Swap the values in the original array
                temp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = temp
                ; Swap the indices as well
                temp = indices[i]
                indices[i] = indices[i + 1]
                indices[i + 1] = temp
                swapped = True
            EndIf
            i += 1
        EndWhile
        n -= 1
    EndWhile
EndFunction

; Function to sort an array from highest to lowest
int[] Function SortArrayDescending(Int[] arr) global
    Int i
    Int j
    Int temp
    Bool didSwap

    ; Outer loop - decreases in size each time
    i = 0
    While (i < arr.Length)
        didSwap = False

        ; Inner loop - bubbles the highest number towards the end
        j = 0
        While (j < arr.Length - 1 - i)
            ; If the current item is less than the next item, swap them
            If (arr[j] < arr[j + 1])
                temp = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
                didSwap = True
            EndIf
            j += 1
        EndWhile

        ; If no numbers were swapped this pass, the array is sorted
        If (didSwap == False)
            return arr
        EndIf

        i += 1
    EndWhile
            
    return arr
EndFunction

int Function GetSumOfArray(int[] arr) global
    int sum = 0

    int i = 0
    while i < arr.Length
        sum += arr[i]
        i += 1
    endwhile
    
    return sum
EndFunction

int[] Function GetEqualArray(int[] arr) global
    int[] NewArray = GetNewIntArray(arr.Length)
    
    int i = 0
    while i < arr.Length
        NewArray[i] = arr[i]
        i += 1
    endwhile
    
    return NewArray
EndFunction

ObjectReference[] Function GetEqualObjectReferenceArray(ObjectReference[] arr) global
    ObjectReference[] NewArray = GetNewArray(arr.Length)
    
    int i = 0
    while i < arr.Length
        NewArray[i] = arr[i]
        i += 1
    endwhile
    
    return NewArray
EndFunction

bool Function CheckIfArraysEqual(int[] arr1, int[] arr2) global
    if arr1.Length != arr2.Length
        return false
    endif

    int i = 0
    while i < arr1.Length
        if arr1[i] != arr2[i]
            return false
        endif
        i += 1
    endwhile
    
    return true
EndFunction

int[] Function FindLeastDifferenceIndices(Int[] arr1, Int[] arr2) Global
    Int[] outIndices = new int[2]
    Int minDiff = 999999 ; Initialize with a very high value
    Int index1 = -1 ; To store the index of the first array
    Int index2 = -1 ; To store the index of the second array

    ; Iterate through every combination of elements between the two arrays
    Int i = 0
    While (i < arr1.Length)
        Int j = 0
        While (j < arr2.Length)
            Int diff = arr1[i] - arr2[j]
            If (diff < 0)
                diff = -diff ; Make sure the difference is positive
            EndIf
            If (diff < minDiff)
                minDiff = diff ; Update the minimum difference
                index1  = arr1[i] ; Update the indices
                index2 = arr2[j]
            EndIf
            j += 1
        EndWhile
        i += 1
    EndWhile

    ; Set the output indices
    outIndices[0] = index1
    outIndices[1] = index2
    
    return outIndices
EndFunction

ObjectReference[] Function ShuffleArray(ObjectReference[] arr) global
    Int n = arr.Length
    Int randomIndex
    ObjectReference tmp
    ObjectReference[] shuffled = new ObjectReference[10]
    
    int i = 0
    While i < n
        shuffled[i] = arr[i]
        i += 1
    EndWhile
    
    While n > 1
        ; Generate a random index between 0 and n-1
        randomIndex = Utility.RandomInt(0, n - 1)
        
        ; Decrement n
        n -= 1
        
        ; Swap shuffled[randomIndex] with shuffled[n]
        tmp = shuffled[randomIndex]
        shuffled[randomIndex] = shuffled[n]
        shuffled[n] = tmp
    EndWhile
    
    return shuffled
EndFunction

int Function GetFactionNum(ObjectReference FactionRef) global
    int FactionNum = (FactionRef as CS_FactionManagementDiplomacy).FactionNum
    return FactionNum
EndFunction

string Function GetFactionName(ObjectReference FactionRef) global
    string FactionName = (FactionRef as CS_FactionManagementDiplomacy).FactionNameString
    return FactionName
EndFunction

string Function GetFactionShortName(ObjectReference FactionRef) global
    string FactionName = (FactionRef as CS_FactionManagementDiplomacy).FactionShortNameString
    return FactionName
EndFunction

bool Function GetFactionsAtWar(ObjectReference Faction1, ObjectReference Faction2) global
    if (Faction1 as CS_FactionManagementDiplomacy).Enemies.Find(Faction2) >= 0
        return true
    else
        return false
    endif
EndFunction

CS_FactionManagementDiplomacy Function GetFactionDiplomacy(ObjectReference FactionRef) global
    return (FactionRef as CS_FactionManagementDiplomacy)
EndFunction

CS_FactionManagementOwnership Function GetFactionOwnership(ObjectReference FactionRef) global
    return (FactionRef as CS_FactionManagementOwnership)
EndFunction

CS_FactionManagementMilitary Function GetFactionMilitary(ObjectReference FactionRef) global
    return (FactionRef as CS_FactionManagementMilitary)
EndFunction

CS_FactionManagementEconomy Function GetFactionEconomy(ObjectReference FactionRef) global
    return (FactionRef as CS_FactionManagementEconomy)
EndFunction

CS_CityManagementPopulation Function GetCityPopulation(ObjectReference CityRef) global
    return (CityRef as CS_CityManagementPopulation)
EndFunction

CS_CityManagementOwnership Function GetCityOwnership(ObjectReference CityRef) global
    return (CityRef as CS_CityManagementOwnership)
EndFunction

CS_CityManagementMilitary Function GetCityMilitary(ObjectReference CityRef) global
    return (CityRef as CS_CityManagementMilitary)
EndFunction

CS_CityManagementEconomy Function GetCityEconomy(ObjectReference CityRef) global
    return (CityRef as CS_CityManagementEconomy)
EndFunction