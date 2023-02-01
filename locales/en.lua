local Translations = {
    success = {
        car_sent = 'Car sent - Model: %{model} - Plate: %{plate} - Recipient: %{recipient}'
    },
    info = {
        car_received = 'Car received - Model: %{model} - Plate: %{plate}',
        retrieve_car = 'Retrieve your new car here: %{garage}'
    },
    other = {
        id = 'id',
        model = 'model'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})