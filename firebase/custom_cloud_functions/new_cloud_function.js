const functions = require("firebase-functions");
const admin = require("firebase-admin");
const proj4 = require("proj4");

// 1. 初始化 Firebase Admin
admin.initializeApp();

// 2. 定义投影参数……
const SVY21 =
  "+proj=tmerc +lat_0=1.366666666666667 " +
  "+lon_0=103.8333333333333 +k=1.0 " +
  "+x_0=28001.642 +y_0=38744.572 " +
  "+ellps=GRS80 +units=m +no_defs";
const WGS84 = proj4.WGS84;

exports.newCloudFunction = functions.firestore
  .document("HDB_Carpark_Information/{docId}")
  .onWrite(async (change, context) => {
    const data = change.after.exists ? change.after.data() : null;
    if (!data || data.lat != null) return null;

    const x = data.x_coord,
      y = data.y_coord;
    if (x == null || y == null) return null;

    try {
      const [lng, lat] = proj4(SVY21, WGS84, [x, y]);
      const newLat = Number(lat.toFixed(6));
      const newLng = Number(lng.toFixed(6));
      await change.after.ref.update({ lat: newLat, lng: newLng });
      console.log(`Converted (${x},${y}) → (${newLat},${newLng})`);
    } catch (err) {
      console.error("投影转换失败：", err);
    }
    return null;
  });
