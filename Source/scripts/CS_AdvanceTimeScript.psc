Scriptname CS_AdvanceTimeScript extends Quest  

GlobalVariable Property GameHour Auto
GlobalVariable Property GameDay Auto
GlobalVariable Property GameMonth Auto
GlobalVariable Property GameYear Auto
GlobalVariable Property GameDaysPassed Auto

function AdvanceTimeBy(float hours)
    float hour
    int day
    int month

    while hours > 24.0
        AdvanceTimeBy(24.0)
        hours -= 24.0
    endwhile

        if hours <= 0.0
            ;return
        endif

    hour = GameHour.GetValue() + hours
    if hour >= 24.0
        hour -= 24.0
        day = GameDay.GetValue() as int + 1
        GameDaysPassed.mod(1.0)

        month = GameMonth.GetValue() as int
        if (day == 29 && month == 2) || (day == 31 && (month == 4 || month == 6 || month == 9 || month == 11)) || (day == 32 && (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12))
            day = 1
            month += 1

            if month > 12
                month = 1
                GameYear.mod(1.0)
            endif

            GameMonth.SetValue(month as float)
        endif
        GameDay.SetValue(day as float)
    endif
    GameHour.SetValue(hour)
endfunction