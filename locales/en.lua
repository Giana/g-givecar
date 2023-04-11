local Translations = {
    error = {
      no_player = 'Error: Cannot get online player from given server ID \'%{id}\''
    },
    success = {
        car_sent = 'Car sent - Model: %{model} - Plate: %{plate} - Recipient: %{recipient}'
    },
    info = {
        car_received = 'Car received - Model: %{model} - Plate: %{plate}',
        retrieve_car = 'Retrieve your new car here: %{garage}'
    },
    other = {
        id = 'id',
        model = 'model',
    },
    text_message = {
        sender = '04482',
        sender_subject = 'Car Sent',
        sender_message = 'You sent a new car.<br><br>Model: %{model}<br>Plate: %{plate}<br>Recipient: %{recipient}',
        recipient_subject = 'Car Received',
        recipient_message = 'You received a new car.<br><br>Model: %{model}<br>Plate: %{plate}<br>Pickup Location: %{garage}'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})