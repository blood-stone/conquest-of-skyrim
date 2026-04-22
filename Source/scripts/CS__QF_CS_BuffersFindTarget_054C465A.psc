;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_BuffersFindTarget_054C465A Extends Quest Hidden

;BEGIN ALIAS PROPERTY BufferTarget001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget019
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget019 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget022
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget022 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget021
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget021 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget020
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget020 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY buffer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_buffer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget024
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget024 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget023
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget023 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BufferTarget025
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BufferTarget025 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
debug.trace("Buffer Quest Started")
BufferScene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
debug.trace("Buffer Quest Stopped")
;(ResetQuest as CS_BuffersFindTargetResetScript).RegisterForSingleUpdate(27)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property ResetQuest  Auto  

Scene Property BufferScene  Auto  
