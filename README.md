# Middleware Rails API to access CIMIS crop growing conditions data.

By [Steve Buckley](steve.buckley@gerrit-tech.com).


## Description
**cimis_api** This api provides a JSON endpoint for a client site such as CropTrackers to access groomed data from the California Irrigation Management Information System (CIMIS).


## Usage

Example JSON request:
> http://___.herokuapp.com/api/v1/stations?station_nbr=238&start_date=2014-01-01&end_date=2014-01-03

Example JSON response:
[{"id":238,"station_nbr":"240","calendar_date":"2014-01-01","daily_max":"78.2","daily_min":"27.6","are_valid":true},
{"id":238,"station_nbr":"240","calendar_date":"2014-01-02","daily_max":"79.8","daily_min":"32.7","are_valid":true},
{"id":238,"station_nbr":"240","calendar_date":"2014-01-03","daily_max":"77.4","daily_min":"34.5","are_valid":true}]

## Information
Code Fellows 'Advanced Dev - Ruby on Rails'


### Known Issues

If you discover any bugs, feel free to create an issue on GitHub fork and
send us a pull request.

[Issues List](Github Issues List URL goes here).

## Authors

* Steve Buckley (github.com/buckley78)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

MIT/X11.
