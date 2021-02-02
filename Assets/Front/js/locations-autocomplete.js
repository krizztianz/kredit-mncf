var locations = [];

$.ajax({
  url: site_url+'front/GetLocations',
  method: "get",
  dataType: 'json',
  async: false,
  success: function(data) {
      locations = data.locations;
  }
});