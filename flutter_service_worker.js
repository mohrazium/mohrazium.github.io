'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"main.dart.js": "71892dc30fd4f16dee8cfa48cd431a65",
"assets/AssetManifest.json": "631283722d1e692b01522139858c3ad3",
"assets/assets/fonts/sahel/sahel_bold.ttf": "1584094c42aaf19d4bbce5287af96506",
"assets/assets/fonts/sahel/sahel_semi_bold.ttf": "b58d3769ead788b3437308c5638913fc",
"assets/assets/fonts/sahel/sahel_black.ttf": "9c080c8466658109036a1606aaf62307",
"assets/assets/fonts/sahel/sahel.ttf": "58aefdefd0adcf0f6ed9d6f5a8457747",
"assets/assets/fonts/sahel/sahel_light.ttf": "fd88ffddfa9fa1f82b865c7ebde3c1d8",
"assets/assets/fonts/FontManifest.json": "db9016be98f2f458c956af9a903066b1",
"assets/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/images/bg41.png": "f80a2867390fe74d08c6a1bfa4e1f744",
"assets/assets/images/login_background.jpg": "5aeefdd65e79f2cdb8720dbf84d5e257",
"assets/assets/images/not_found.png": "d3867ac7a4e274a57650ec73017f2d42",
"assets/assets/images/bg102.png": "a53ca67288f3e9a3933410fd5f1239bb",
"assets/assets/images/bg151.png": "74e12315c2d7f9dd4ff20a7a1e3f827f",
"assets/assets/images/backgound.jpg": "046c06e402783fcf0ad9b34efeea6339",
"assets/assets/icons/error.png": "8f4a0bf32c1fab345c9dcf0cd1a46fb7",
"assets/assets/icons/warning.png": "609e4e72cbb57facd14c0530740ac959",
"assets/assets/icons/flag_fa.png": "8d226550fd3b2b970f947955862e461b",
"assets/assets/icons/spring-logo.png": "ca87a99c2035bf8a1c9ca81caa07ef5b",
"assets/assets/icons/warn.png": "b35f97f8763402cc5504848f45d32ee7",
"assets/assets/icons/logo32.png": "a8a50fec3cebcd78ae8fb5955d07f141",
"assets/assets/icons/failure.png": "f80cc1c931048221232eb317b67224b3",
"assets/assets/icons/success.png": "aafba484de572d1aef931ecc1d7c85cf",
"assets/assets/icons/info.png": "669c3391493a2e6c32c814b0cb5902fd",
"assets/assets/icons/mysql.png": "da0b11b904ddb62bdce04e762c543bc1",
"assets/assets/icons/logo96.png": "2c7ff0d433a5ab34217532a2da713882",
"assets/assets/icons/logo16.png": "6a5d3f83de40ba367249999bc8f76909",
"assets/assets/icons/flag_en.png": "b0b497c74adcc97bf1d0f69b1fc2594a",
"assets/assets/icons/java-coffee-cup-logo.png": "5a70ddd2ad57f7d7c361ae003ae7770f",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/eva_icons_flutter/lib/fonts/Eva-Icons.ttf": "a71dbd49ad4a52020638190e30ac52e0",
"assets/FontManifest.json": "b39f502bc7a21ffd15dceff42f08ad2d",
"assets/NOTICES": "c73c7a6f18a6fbc4402f86f4ab2ce03f",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"index.html": "8f6fac3d3615507819bda96d98a07fc3",
"/": "8f6fac3d3615507819bda96d98a07fc3",
"favicon.png": "de9839238f0a609c19b68652c008377a",
"version.json": "ae95f786c61962d0244ad8004b9f1d72",
"manifest.json": "9c932441973fcbd09fe8adc3d77714cd",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
