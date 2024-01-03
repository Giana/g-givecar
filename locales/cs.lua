local Translations = {
    error = {
        no_player = 'Chyba: Nelze získat online hráče podle zadaného ID serveru \'%{id}\''
    },
    success = {
        car_sent = 'Auto odesláno - Model: %{model} - Značka: %{plate} - Příjemce: %{recipient}'
    },
    info = {
        car_received = 'Auto přijato - Model: %{model} - Značka: %{plate}',
        retrieve_car = 'Vyzvedněte své nové auto zde: %{garage}'
    },
    other = {
        id = 'id',
        model = 'model',
    },
    text_message = {
        sender = '04482',
        sender_subject = 'Odeslané auto',
        sender_message = 'Odeslali jste nové auto.<br><br>Model: %{model}<br>Značka: %{plate}<br>Příjemce: %{recipient}',
        recipient_subject = 'Přijaté auto',
        recipient_message = 'Přijali jste nové auto.<br><br>Model: %{model}<br>Značka: %{plate}<br>Místo vyzvednutí: %{garage}'
    }
}

if GetConvar('qb_locale', 'en') == 'cs' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
--translate by stepan_valic
