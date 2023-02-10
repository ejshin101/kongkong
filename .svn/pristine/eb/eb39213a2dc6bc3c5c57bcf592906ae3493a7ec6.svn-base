<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>GoogleMap</title>
<style>
 #google-map{
    width: 100%;
  height: 600px;
}

table {
    font-size: 12px;
  }
  #map {
    width: 840px;
  }
  #listing {
    position: absolute;
    width: 190px;
    height: 600px;
    overflow: auto;
    left: 0px;
    top: 220px;
    cursor: pointer;
    overflow-x: hidden;
  }
  #findhotels {
    position: absolute;
    text-align: right;
    width: 100px;
    font-size: 14px;
    padding: 4px;
    z-index: 5;
    background-color: #fff;
  }
  #locationField {
    width: 190px;
    height: 25px;
    left: 108px;
    top: 0px;
    z-index: 5;
    background-color: #fff;
  }
  #controls {
    left: 300px;
    width: 140px;
    top: 0px;
    z-index: 5;
    background-color: #fff;
  }
  #autocomplete {
    width: 100%;
  }
  #country {
    width: 100%;
  }
  .placeIcon {
    width: 20px;
    height: 34px;
    margin: 4px;
  }
  .hotelIcon {
    width: 24px;
    height: 24px;
  }
  #resultsTable {
    border-collapse: collapse;
    width: 240px;
  }
  #rating {
    font-size: 13px;
    font-family: Arial Unicode MS;
  }
  .iw_table_row {
    height: 18px;
  }
  .iw_attribute_name {
    font-weight: bold;
    text-align: right;
  }
  .iw_table_icon {
    text-align: right;
  }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp"%>
<br>
  <div class="hotel-search">
    <div id="controls">
      <select id="country">
        <option value="all" selected>All</option>
        <option value="au">Australia</option>
        <option value="br">Brazil</option>
        <option value="ca">Canada</option>
        <option value="fr">France</option>
        <option value="de">Germany</option>
        <option value="mx">Mexico</option>
        <option value="nz">New Zealand</option>
        <option value="it">Italy</option>
        <option value="za">South Africa</option>
        <option value="es">Spain</option>
        <option value="pt">Portugal</option>
        <option value="us">U.S.A.</option>
        <option value="uk">United Kingdom</option>
        <option value="kr">한국</option>
      </select>
    </div>
    <div id="locationField">
      <input id="autocomplete" placeholder="어디로 갈까요?" type="text" />
    </div>
  </div>
  <br>
  <div id="google-map">
    <!--지도 생성위치-->
  </div>

  <div id="listing">
    <table id="resultsTable">
      <tbody id="results"></tbody>
    </table>
  </div>

  <div style="display: none">
    <div id="info-content">
      <table>
        <tr id="iw-url-row" class="iw_table_row">
          <td id="iw-icon" class="iw_table_icon"></td>
          <td id="iw-url"></td>
        </tr>
        <tr id="iw-address-row" class="iw_table_row">
          <td class="iw_attribute_name">주소::</td>
          <td id="iw-address"></td>
        </tr>
        <tr id="iw-phone-row" class="iw_table_row">
          <td class="iw_attribute_name">전화번호:</td>
          <td id="iw-phone"></td>
        </tr>
        <tr id="iw-rating-row" class="iw_table_row">
          <td class="iw_attribute_name">별점:</td>
          <td id="iw-rating"></td>
        </tr>
        <tr id="iw-website-row" class="iw_table_row">
          <td class="iw_attribute_name">홈페이지:</td>
          <td id="iw-website"></td>
        </tr>
      </table>
    </div>
  </div>
  </div>
  <script>
    let map, places, infoWindow, autocomplete;
    let markers = [];
    const countryRestrict = { country: "kr" };
    const MARKER_PATH =
      "https://developers.google.com/maps/documentation/javascript/images/marker_green";
    const hostnameRegexp = new RegExp("^https?://.+?/");
    const countries = {
      au: {
        center: { lat: -25.3, lng: 133.8 },
        zoom: 4,
      },
      br: {
        center: { lat: -14.2, lng: -51.9 },
        zoom: 3,
      },
      ca: {
        center: { lat: 62, lng: -110.0 },
        zoom: 3,
      },
      fr: {
        center: { lat: 46.2, lng: 2.2 },
        zoom: 5,
      },
      de: {
        center: { lat: 51.2, lng: 10.4 },
        zoom: 5,
      },
      mx: {
        center: { lat: 23.6, lng: -102.5 },
        zoom: 4,
      },
      nz: {
        center: { lat: -40.9, lng: 174.9 },
        zoom: 5,
      },
      it: {
        center: { lat: 41.9, lng: 12.6 },
        zoom: 5,
      },
      za: {
        center: { lat: -30.6, lng: 22.9 },
        zoom: 5,
      },
      es: {
        center: { lat: 40.5, lng: -3.7 },
        zoom: 5,
      },
      pt: {
        center: { lat: 39.4, lng: -8.2 },
        zoom: 6,
      },
      us: {
        center: { lat: 37.1, lng: -95.7 },
        zoom: 3,
      },
      uk: {
        center: { lat: 54.8, lng: -4.6 },
        zoom: 5,
      },
      kr: {
        center: { lat: 36.4, lng: 128.0 },
        zoom: 6.5
      }
    };

    function initMap() {
      map = new google.maps.Map(document.getElementById("google-map"), {
        zoom: countries["kr"].zoom,
        center: countries["kr"].center,
        mapTypeControl: false,
        panControl: false,
        zoomControl: false,
        streetViewControl: false,
      });

      infoWindow = new google.maps.InfoWindow({
        content: document.getElementById("info-content"),
      });
      // 자동지역 검색 제한하는곳 
      autocomplete = new google.maps.places.Autocomplete(
        document.getElementById("autocomplete"),
        {
          types: ["(regions)"],
          componentRestrictions: countryRestrict,
        }
      );
      places = new google.maps.places.PlacesService(map);
      $("#autocomplete").on("keydown", function (e) {
        if (e.which == 13) {
          onPlaceChanged();
        }
      });
      autocomplete.addListener("place_changed", onPlaceChanged);
      document.getElementById("country").addEventListener("change", setAutocompleteCountry);
      map.addListener("dragend", search);
    }//intitMap   https://developers.google.com/maps/documentation/javascript/events?hl=ko

    // 나라 선택시 정보랑 줌해주는곳
    function onPlaceChanged() {
      const place = autocomplete.getPlace();

      if (place.geometry && place.geometry.location) {
        map.panTo(place.geometry.location);
        map.setZoom(14);
        search();
      } else {
        document.getElementById("autocomplete").placeholder = "어디로 갈까요?";
      }
    }
    function search() {
      const search = {
        bounds: map.getBounds(),
        types: ["lodging"], // https://developers.google.com/maps/documentation/places/web-service/supported_types?hl=fi
      };
      places.nearbySearch(search, (results, status, pagination) => {
        if (status === google.maps.places.PlacesServiceStatus.OK && results) {
          clearResults();
          clearMarkers();
          // 찾은면 알파벳 주고 마크생성하기
          for (let i = 0; i < results.length; i++) {
            const markerLetter = String.fromCharCode("A".charCodeAt(0) + (i % 26));
            const markerIcon = MARKER_PATH + markerLetter + ".png";
            // 마커애니메이션
            markers[i] = new google.maps.Marker({
              position: results[i].geometry.location,
              animation: google.maps.Animation.DROP,
              icon: markerIcon,
            });
            //마커 클릭하면 정보주기
            markers[i].placeResult = results[i];
            google.maps.event.addListener(markers[i], "click", showInfoWindow);
            setTimeout(dropMarker(i), i * 100);
            addResult(results[i], i);
          }
        }
      });
    }

    function clearMarkers() {
      for (let i = 0; i < markers.length; i++) {
        if (markers[i]) {
          markers[i].setMap(null);
        }
      }
      markers = [];
    }
    // 나라 줌인, 검색제한 거는곳 
    function setAutocompleteCountry() {
      const country = document.getElementById("country").value;

      if (country == "all") {
        autocomplete.setComponentRestrictions({ country: [] });
        map.setCenter({ lat: 15, lng: 0 });
        map.setZoom(2);
      } else {
        autocomplete.setComponentRestrictions({ country: country });
        map.setCenter(countries[country].center);
        map.setZoom(countries[country].zoom);
      }
      clearResults();
      clearMarkers();
    }

    function dropMarker(i) {
      return function () {
        markers[i].setMap(map);
      };
    }
    //마크정보
    function addResult(result, i) {
      const results = document.getElementById("results");
      const markerLetter = String.fromCharCode("A".charCodeAt(0) + (i % 26));
      const markerIcon = MARKER_PATH + markerLetter + ".png";
      const tr = document.createElement("tr");
      tr.style.backgroundColor = i % 2 === 0 ? "#F0F0F0" : "#FFFFFF";

      tr.onclick = function () {
        google.maps.event.trigger(markers[i], "click");
      };
      const iconTd = document.createElement("td");
      const nameTd = document.createElement("td");
      const icon = document.createElement("img");
      icon.src = markerIcon;
      icon.setAttribute("class", "placeIcon");
      icon.setAttribute("className", "placeIcon");
      const name = document.createTextNode(result.name);
      iconTd.appendChild(icon);
      nameTd.appendChild(name);
      tr.appendChild(iconTd);
      tr.appendChild(nameTd);
      results.appendChild(tr);
    }

    function clearResults() {
      const results = document.getElementById("results");

      while (results.childNodes[0]) {
        results.removeChild(results.childNodes[0]);
      }
    }
    // 인포 윈도우 정보띄우는곳
    function showInfoWindow() {
      const marker = this;
      places.getDetails(
        { placeId: marker.placeResult.place_id },
        (place, status) => {
          if (status !== google.maps.places.PlacesServiceStatus.OK) {
            return;
          }
          infoWindow.open(map, marker);
          buildIWContent(place);
        }
      );
    }

    //검색 정보를 Html elements로 바꾸는곳
    function buildIWContent(place) {
      document.getElementById("iw-icon").innerHTML =
        '<img class="hotelIcon" ' + 'src="' + place.icon + '"/>';
      document.getElementById("iw-url").innerHTML =
        '<b><a href="' + place.url + '">' + place.name + "</a></b>";
      document.getElementById("iw-address").textContent = place.vicinity;

      if (place.formatted_phone_number) {
        document.getElementById("iw-phone-row").style.display = "";
        document.getElementById("iw-phone").textContent =
          place.formatted_phone_number;
      } else {
        document.getElementById("iw-phone-row").style.display = "none";
      }

      // 별점주는곳
      if (place.rating) {
        let ratingHtml = "";

        for (let i = 0; i < 5; i++) {
          if (place.rating < i + 0.5) {
            ratingHtml += "&#10025;";
          } else {
            ratingHtml += "&#10029;";
          }
          document.getElementById("iw-rating-row").style.display = "";
          document.getElementById("iw-rating").innerHTML = ratingHtml;
        }
      } else {
        document.getElementById("iw-rating-row").style.display = "none";
      }

      // The regexp isolates the first part of the URL (domain plus subdomain)
      // to give a short URL for displaying in the info window.
      if (place.website) {
        let fullUrl = place.website;
        let website = String(hostnameRegexp.exec(place.website));

        if (!website) {
          website = "http://" + place.website + "/";
          fullUrl = website;
        }
        document.getElementById("iw-website-row").style.display = "";
        document.getElementById("iw-website").textContent = website;
      } else {
        document.getElementById("iw-website-row").style.display = "none";
      }
    }  // buildIWContent

  </script>
  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-kYmuKq38x7DnHMzYs8_rrcYEo0Eq8sw&callback=initMap&libraries=places&v=weekly">
    </script>
</body>

</html>