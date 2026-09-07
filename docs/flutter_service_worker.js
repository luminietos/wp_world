'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1cce5e949606687fa2b8e179cc57e5b3",
"assets/AssetManifest.bin.json": "70f8a87b8fdbb525fca02ecaad4274ee",
"assets/AssetManifest.json": "f9fe27bd3a987e958857993fd593192c",
"assets/assets/fonts/NotoSans-Regular.ttf": "b72e420edb95cdf06e6e0a27bc0d964d",
"assets/FontManifest.json": "b49fca8840e5f4f9cde07cdc0dc37770",
"assets/fonts/MaterialIcons-Regular.otf": "8243943dd601cd9e708c95414d9c318b",
"assets/NOTICES": "9d57116d62b3cc8d1eb1393a32c90480",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_country_flags/assets/ad.png": "b58f390d7f957d5b27fd5343dfe0440d",
"assets/packages/flutter_country_flags/assets/ae.png": "d3a228f0d9c3706ead20fe6a1aec1de8",
"assets/packages/flutter_country_flags/assets/af.png": "69976c799f41f89f7133da747b33c08e",
"assets/packages/flutter_country_flags/assets/ag.png": "e332c5f198af72ba35bbcea22546293f",
"assets/packages/flutter_country_flags/assets/ai.png": "e9a5156faf91318094df07df702f976b",
"assets/packages/flutter_country_flags/assets/al.png": "b5b15e0b0163ace2d6eb0da2ffec6416",
"assets/packages/flutter_country_flags/assets/am.png": "55d71092c291a382a8fb4e0dae4b76a0",
"assets/packages/flutter_country_flags/assets/an.png": "2aaab4636955c0e2609ad551e8e938cf",
"assets/packages/flutter_country_flags/assets/ao.png": "eec240bde52c32770eeacd027b193347",
"assets/packages/flutter_country_flags/assets/aq.png": "947030b9fb778b63ab28954c545ea4c7",
"assets/packages/flutter_country_flags/assets/ar.png": "b8a60b09d7db59ca8e34d0c391f7cf47",
"assets/packages/flutter_country_flags/assets/as.png": "d3ee7d8aeade5f87a5ab6ea1c53c1181",
"assets/packages/flutter_country_flags/assets/at.png": "3d36c83a3d671b11f755c891bd8de687",
"assets/packages/flutter_country_flags/assets/au.png": "63084e9484c0b6db451a1d68ad5adeb9",
"assets/packages/flutter_country_flags/assets/aw.png": "01f11f497399c715de5f2561b93b8ef8",
"assets/packages/flutter_country_flags/assets/ax.png": "adc1e135fd79d41a3d968de5ec048d8a",
"assets/packages/flutter_country_flags/assets/az.png": "632021e40bfc042416ad01c944db2921",
"assets/packages/flutter_country_flags/assets/ba.png": "c00b74603623d9a146912fafda3377f1",
"assets/packages/flutter_country_flags/assets/bb.png": "fbfdbaaf55f80b74dcf674dd67d766f3",
"assets/packages/flutter_country_flags/assets/bd.png": "1721b5dfe5a2ea0b99adfe0fd5aa9f1f",
"assets/packages/flutter_country_flags/assets/be.png": "6c7022eda06794dc916358268cb08d50",
"assets/packages/flutter_country_flags/assets/bf.png": "5746b4e7bb2c86e7a2dc5077226b9952",
"assets/packages/flutter_country_flags/assets/bg.png": "6b473783a5c5b427e668a2048022663e",
"assets/packages/flutter_country_flags/assets/bh.png": "7533d290739c20bd2d0250414a74c19d",
"assets/packages/flutter_country_flags/assets/bi.png": "2c1d426f4b941b9638303c34145ba672",
"assets/packages/flutter_country_flags/assets/bj.png": "04f9872301a332efdd91735631f3d438",
"assets/packages/flutter_country_flags/assets/bl.png": "536f99fa693e6b52a21c67e983632092",
"assets/packages/flutter_country_flags/assets/bm.png": "72e7fff10d3168e4c62bad5465598db0",
"assets/packages/flutter_country_flags/assets/bn.png": "1f1c5a29f9a6fd77963f7bb3de5946c2",
"assets/packages/flutter_country_flags/assets/bo.png": "74bac15d186993c09eecdde11876b401",
"assets/packages/flutter_country_flags/assets/bq.png": "3649c177693bfee9c2fcc63c191a51f1",
"assets/packages/flutter_country_flags/assets/br.png": "4d47e5b273c0043e76bfd6ac76c3e035",
"assets/packages/flutter_country_flags/assets/bs.png": "0b6796dfa9a54bf9c6473a005cc7f687",
"assets/packages/flutter_country_flags/assets/bt.png": "43e973113f8c57a5cd303a49b5f371da",
"assets/packages/flutter_country_flags/assets/bv.png": "ae5d87669104732f61cca68d6bd10cbf",
"assets/packages/flutter_country_flags/assets/bw.png": "d50ac293dc1f0534aedb989c8ded82c0",
"assets/packages/flutter_country_flags/assets/by.png": "c5d14943250d54b4a630794c5648c687",
"assets/packages/flutter_country_flags/assets/bz.png": "3b84100ca29a0bc77474677e9da6fc0f",
"assets/packages/flutter_country_flags/assets/ca.png": "e20a51380b2da69353e3755edead340d",
"assets/packages/flutter_country_flags/assets/cc.png": "5d1c266d4620dc7203023882a7b647e5",
"assets/packages/flutter_country_flags/assets/cd.png": "f0b60b807ec62ebfc391ff50c79ec30e",
"assets/packages/flutter_country_flags/assets/cf.png": "acb28ea1b07b24c3e4984a6698faef24",
"assets/packages/flutter_country_flags/assets/cg.png": "502df6404e41cb76d033af895f34eb2c",
"assets/packages/flutter_country_flags/assets/ch.png": "fe8519b23bed3b2e8669dac779c3cb55",
"assets/packages/flutter_country_flags/assets/ci.png": "a490576a22f2c67f1d331cbc5098f5f1",
"assets/packages/flutter_country_flags/assets/ck.png": "882bc3896cdd040757972bcbbf75e4bb",
"assets/packages/flutter_country_flags/assets/cl.png": "6735e0e2d88c119e9ed1533be5249ef1",
"assets/packages/flutter_country_flags/assets/cm.png": "12c2c677c148caa9f6464050ea5647eb",
"assets/packages/flutter_country_flags/assets/cn.png": "26c512b86a77d796629adf61862475ac",
"assets/packages/flutter_country_flags/assets/co.png": "37dbdf7ef835ea7ee2c1bdcf91e9a2bb",
"assets/packages/flutter_country_flags/assets/cr.png": "40dc5bc52eb9391bd6d1bf895b107a65",
"assets/packages/flutter_country_flags/assets/cu.png": "82ec98ab8b9832e6a182367a5dd16f93",
"assets/packages/flutter_country_flags/assets/cv.png": "a5193806962944dad9ee6c9c91f5cf10",
"assets/packages/flutter_country_flags/assets/cw.png": "7132ff340c5f3fef7f163b60f2c841e2",
"assets/packages/flutter_country_flags/assets/cx.png": "d5a6ca51e490d03b06a647d652d3fdb0",
"assets/packages/flutter_country_flags/assets/cy.png": "f63fce2edfbc2aac831d6934e82a336f",
"assets/packages/flutter_country_flags/assets/cz.png": "9e16a631c6e170d3415c005061b1e5da",
"assets/packages/flutter_country_flags/assets/de.png": "e2227152ece494eabbb6b184dfb9f9a9",
"assets/packages/flutter_country_flags/assets/dj.png": "6816bcba85e0179c4c1fafb76f35cd93",
"assets/packages/flutter_country_flags/assets/dk.png": "2f452388777897cd70a25b1295582938",
"assets/packages/flutter_country_flags/assets/dm.png": "013b44702a8fb5773a0983085b0dc076",
"assets/packages/flutter_country_flags/assets/do.png": "e625b779a26a0130150b0a5bafe24380",
"assets/packages/flutter_country_flags/assets/dz.png": "7372cc9383ca55804d35ca60d09f2ab9",
"assets/packages/flutter_country_flags/assets/ec.png": "746ed5202fb98b28f7031393c2b479da",
"assets/packages/flutter_country_flags/assets/ee.png": "69e0ffbab999ade674a9b07db0ee3941",
"assets/packages/flutter_country_flags/assets/eg.png": "97843ac1dffee8cf3b3e7b341a38893e",
"assets/packages/flutter_country_flags/assets/eh.png": "f91039d93b511ab8baba3a6242f21359",
"assets/packages/flutter_country_flags/assets/er.png": "300cbfb7dda5e2eea87e9b03660a6077",
"assets/packages/flutter_country_flags/assets/es.png": "a290e5120fe89e60d72009815478d0d3",
"assets/packages/flutter_country_flags/assets/et.png": "7bc0f7bd7b4c252b375fc5bd94fe6a3f",
"assets/packages/flutter_country_flags/assets/eu.png": "38336a6139fea0f3e2daa5a135e70d1d",
"assets/packages/flutter_country_flags/assets/fi.png": "3ccd69a842e55183415b7ea2c04b15c8",
"assets/packages/flutter_country_flags/assets/fj.png": "7970a279e5034d20c73b904388df7cba",
"assets/packages/flutter_country_flags/assets/fk.png": "d599200dd54a121ac54e4895f97f19b1",
"assets/packages/flutter_country_flags/assets/fm.png": "03c6a315c3acedae9a51cb444c99be5e",
"assets/packages/flutter_country_flags/assets/fo.png": "ccd988f6309e4245cfa36478e103fb9b",
"assets/packages/flutter_country_flags/assets/fr.png": "4fa81d3430e630527b8c6987619e85dc",
"assets/packages/flutter_country_flags/assets/ga.png": "7a9bd1b751a4c92c4a00897dbb973214",
"assets/packages/flutter_country_flags/assets/gb-eng.png": "0d9f2a6775fd52b79e1d78eb1dda10cf",
"assets/packages/flutter_country_flags/assets/gb-nir.png": "09af1c5f1433c02e97a95286ce24f4d4",
"assets/packages/flutter_country_flags/assets/gb-sct.png": "d55a9a9d41e9dc61cbeef059519d5618",
"assets/packages/flutter_country_flags/assets/gb-wls.png": "74e73d030683c21d2183d92025d11be9",
"assets/packages/flutter_country_flags/assets/gb.png": "09af1c5f1433c02e97a95286ce24f4d4",
"assets/packages/flutter_country_flags/assets/gd.png": "7d4b72f73674133acb00c0ea3959e16b",
"assets/packages/flutter_country_flags/assets/ge.png": "3fb1b71b32fb6bbd4e757adba06ce216",
"assets/packages/flutter_country_flags/assets/gf.png": "4004b2e3ec6c151fe4cb43e902280952",
"assets/packages/flutter_country_flags/assets/gg.png": "0a697b4266f87119aeb8a2ffe3b15498",
"assets/packages/flutter_country_flags/assets/gh.png": "b35464dca793fa33e51bf890b5f3d92b",
"assets/packages/flutter_country_flags/assets/gi.png": "987d065705257febe56bdbe05a294749",
"assets/packages/flutter_country_flags/assets/gl.png": "fb536122819fd1d3fc18c02c7df93865",
"assets/packages/flutter_country_flags/assets/gm.png": "be81263dd47ca1f99936f78f6b5dfc4a",
"assets/packages/flutter_country_flags/assets/gn.png": "30b014c10d88f166e4bfd46bbc235ebe",
"assets/packages/flutter_country_flags/assets/gp.png": "4fa81d3430e630527b8c6987619e85dc",
"assets/packages/flutter_country_flags/assets/gq.png": "de93250a1de5e482f88bc5309ce21ac0",
"assets/packages/flutter_country_flags/assets/gr.png": "ed1304c7d8e6a64f31e7b65c4beea944",
"assets/packages/flutter_country_flags/assets/gs.png": "191d4b79605c08effa5b3def9834c9d6",
"assets/packages/flutter_country_flags/assets/gt.png": "2791b68757cd31e89af8817817e589f0",
"assets/packages/flutter_country_flags/assets/gu.png": "7e51aa7e3adaf526a8722350e0477192",
"assets/packages/flutter_country_flags/assets/gw.png": "806f63c256bddd4f1680529f054f4043",
"assets/packages/flutter_country_flags/assets/gy.png": "64f3007da6bdc84a25d8ad6b5d7f3094",
"assets/packages/flutter_country_flags/assets/hk.png": "69a77d8a25952f39fe6aadafb6f7efc2",
"assets/packages/flutter_country_flags/assets/hm.png": "63084e9484c0b6db451a1d68ad5adeb9",
"assets/packages/flutter_country_flags/assets/hn.png": "5fcf2451994a42af2bba0c17717ed13f",
"assets/packages/flutter_country_flags/assets/hr.png": "3175463c3e7e42116d5b59bc1da19a3f",
"assets/packages/flutter_country_flags/assets/ht.png": "a49a27479ed8be33d962898febc049f1",
"assets/packages/flutter_country_flags/assets/hu.png": "ff1d0e2bc549da022f2312c4ac7ca109",
"assets/packages/flutter_country_flags/assets/id.png": "80bb82d11d5bc144a21042e77972bca9",
"assets/packages/flutter_country_flags/assets/ie.png": "1d91912afc591dd120b47b56ea78cdbf",
"assets/packages/flutter_country_flags/assets/il.png": "ee933479696b8c80d2ade96ee344a89c",
"assets/packages/flutter_country_flags/assets/im.png": "d3da8affefefe4ec55770c9f3f43f117",
"assets/packages/flutter_country_flags/assets/in.png": "0f1b94cf838fa1b86c172da4ab3db7e1",
"assets/packages/flutter_country_flags/assets/io.png": "d4910e28f0164bc879999c17024d543c",
"assets/packages/flutter_country_flags/assets/iq.png": "9434c17a6d4653df965e3276137764a1",
"assets/packages/flutter_country_flags/assets/ir.png": "5d8864e2235f7acb3063a9f32684c80e",
"assets/packages/flutter_country_flags/assets/is.png": "9fce179e688579504fb8210c51aed66d",
"assets/packages/flutter_country_flags/assets/it.png": "ff7064f6e37512ff41e665f3a4987e70",
"assets/packages/flutter_country_flags/assets/je.png": "6fcdb123f8bf3cafea5537542018b151",
"assets/packages/flutter_country_flags/assets/jm.png": "87dbf861e528586787fdf8b6617e2f61",
"assets/packages/flutter_country_flags/assets/jo.png": "79a73b63a1e0d78a08da882b146a2224",
"assets/packages/flutter_country_flags/assets/jp.png": "fc7c3eb4c199252dc35730939ca4384d",
"assets/packages/flutter_country_flags/assets/ke.png": "3e54059985907a758bb0531a711522fb",
"assets/packages/flutter_country_flags/assets/kg.png": "e0eab32f37a96e43df134e70db49482a",
"assets/packages/flutter_country_flags/assets/kh.png": "25e4099457402866cc1fabcd4506c6cc",
"assets/packages/flutter_country_flags/assets/ki.png": "a93bda4f0f004d9c865f93d25c81ce18",
"assets/packages/flutter_country_flags/assets/km.png": "c631326a464f21c51fbfd767be9bcf39",
"assets/packages/flutter_country_flags/assets/kn.png": "11889e3432a57b8327eaeb5f34951db5",
"assets/packages/flutter_country_flags/assets/kp.png": "8fcc8f2fc646b484b4a47cdc0ff21cab",
"assets/packages/flutter_country_flags/assets/kr.png": "f36e020411beb5d89c1accce5acb1dd1",
"assets/packages/flutter_country_flags/assets/kw.png": "cac0e665bc61366ffeb1cb08c24b609b",
"assets/packages/flutter_country_flags/assets/ky.png": "bacc27cd23c1e359244533ecb9043de6",
"assets/packages/flutter_country_flags/assets/kz.png": "caba66830ed539d3f86431ddf4006e72",
"assets/packages/flutter_country_flags/assets/la.png": "ab542ca6e9c4e1911e70cb6178dd64a6",
"assets/packages/flutter_country_flags/assets/lb.png": "30e7e0ee297d535bed953d7ad3321c6f",
"assets/packages/flutter_country_flags/assets/lc.png": "32e5433954c7a99cd53c1e67f2ac604a",
"assets/packages/flutter_country_flags/assets/li.png": "1abb7f4421487e6f40007c97ccf98c3d",
"assets/packages/flutter_country_flags/assets/lk.png": "b7ab4259e284bb6f4f30cb8ec5e9b1b6",
"assets/packages/flutter_country_flags/assets/lr.png": "ef37f094c6b37fbd2343bc800b2a35e5",
"assets/packages/flutter_country_flags/assets/ls.png": "2bca756f9313957347404557acb532b0",
"assets/packages/flutter_country_flags/assets/lt.png": "d79eb564dd857c66ddd65a41f4cdfe4e",
"assets/packages/flutter_country_flags/assets/lu.png": "31349218e6c2a6e900a3a83baa8f61d2",
"assets/packages/flutter_country_flags/assets/lv.png": "4370f6f09eecc21db000bd09191f3ff3",
"assets/packages/flutter_country_flags/assets/ly.png": "c6d7280c521faa563e07b1f8bec1d9b7",
"assets/packages/flutter_country_flags/assets/ma.png": "2302b44a7fe96ca595ea9528271a1ad9",
"assets/packages/flutter_country_flags/assets/mc.png": "6375a336b1fd53d0e918ae945523078c",
"assets/packages/flutter_country_flags/assets/md.png": "d579fff3f3b7644d54cdad3fbcdd501e",
"assets/packages/flutter_country_flags/assets/me.png": "a2ca2c8d5567775b6f00634bcdb7a6f9",
"assets/packages/flutter_country_flags/assets/mf.png": "4fa81d3430e630527b8c6987619e85dc",
"assets/packages/flutter_country_flags/assets/mg.png": "0ef6271ad284ebc0069ff0aeb5a3ad1e",
"assets/packages/flutter_country_flags/assets/mh.png": "575772c6fb22f9d6e470c627cacb737e",
"assets/packages/flutter_country_flags/assets/mk.png": "b84591fe5860ed7accf9ff7e7307f099",
"assets/packages/flutter_country_flags/assets/ml.png": "82bf0ca0c67d2371207a540b40c320fc",
"assets/packages/flutter_country_flags/assets/mm.png": "0073e71d8d7d5c7f6ee70c828be1b7c8",
"assets/packages/flutter_country_flags/assets/mn.png": "22d7616bc740394c5ae5b384bf2ef225",
"assets/packages/flutter_country_flags/assets/mo.png": "08f0124b030743d010253d0108ef3b7f",
"assets/packages/flutter_country_flags/assets/mp.png": "895e2aea9e8a9fb4a3db09ba75b2ae11",
"assets/packages/flutter_country_flags/assets/mq.png": "394a6076943d6eb57ee10c7f2e044e1c",
"assets/packages/flutter_country_flags/assets/mr.png": "253fc7fdd3d3360dfd2e8d726a3c27f7",
"assets/packages/flutter_country_flags/assets/ms.png": "438b3ae48465543239a679ef915378de",
"assets/packages/flutter_country_flags/assets/mt.png": "2c20ed4b1721ad71677d7e26f95425cd",
"assets/packages/flutter_country_flags/assets/mu.png": "f00d3c927769eaf3bbc4d2c249ea3418",
"assets/packages/flutter_country_flags/assets/mv.png": "8468c7f25a4b5dc7403146da72bd8126",
"assets/packages/flutter_country_flags/assets/mw.png": "47fb9232df51b3a1de93fda80a795163",
"assets/packages/flutter_country_flags/assets/mx.png": "7e557bb1bf47d52b6f3820e647fa5f98",
"assets/packages/flutter_country_flags/assets/my.png": "e7fc1cb576089cfed2e7fa8071af4cd8",
"assets/packages/flutter_country_flags/assets/mz.png": "3bce789f6780525f09212b677239f2d5",
"assets/packages/flutter_country_flags/assets/na.png": "2431d5e2158f15bbcbad8e57bb78f25d",
"assets/packages/flutter_country_flags/assets/nc.png": "b94385d139bf8b82b5b3f20559feece5",
"assets/packages/flutter_country_flags/assets/ne.png": "89c2cbd76d15ae5c43f814b5ef5010dd",
"assets/packages/flutter_country_flags/assets/nf.png": "4a9944f819ff0fc923f619184ae3c6df",
"assets/packages/flutter_country_flags/assets/ng.png": "eeb857562b3dfcd105aef9ec371a916f",
"assets/packages/flutter_country_flags/assets/ni.png": "41e2831687e9997fa4d5f4eb0700cc84",
"assets/packages/flutter_country_flags/assets/nl.png": "3649c177693bfee9c2fcc63c191a51f1",
"assets/packages/flutter_country_flags/assets/no.png": "ae5d87669104732f61cca68d6bd10cbf",
"assets/packages/flutter_country_flags/assets/np.png": "99ba0ec8de01de3bc62146b2ffd1f96e",
"assets/packages/flutter_country_flags/assets/nr.png": "c96262cfab530f60649c118ad21ab65f",
"assets/packages/flutter_country_flags/assets/nu.png": "146c66c2ede3bd38ec680f76ef6525a0",
"assets/packages/flutter_country_flags/assets/nz.png": "d22c137d0038c20c1fa98ae2ed3729b0",
"assets/packages/flutter_country_flags/assets/om.png": "b16ebc34417eb7a6ad7ed0e3c79a71c0",
"assets/packages/flutter_country_flags/assets/pa.png": "3215dc6016afeb373faacc38ee34b3d4",
"assets/packages/flutter_country_flags/assets/pe.png": "b722a28a444000bab6cd03e859112e42",
"assets/packages/flutter_country_flags/assets/pf.png": "33211a88528a8f7369d4bf92766131b2",
"assets/packages/flutter_country_flags/assets/pg.png": "96c8233f13b1f4e7200d6ac4173de697",
"assets/packages/flutter_country_flags/assets/ph.png": "158bd50b6f2d18f398e8600f6663b488",
"assets/packages/flutter_country_flags/assets/pk.png": "c341fe3cf9392ed6a3b178269c1d9f0c",
"assets/packages/flutter_country_flags/assets/pl.png": "e8714e9460929665055f1c93dce1bf61",
"assets/packages/flutter_country_flags/assets/pm.png": "4fa81d3430e630527b8c6987619e85dc",
"assets/packages/flutter_country_flags/assets/pn.png": "0205d0644f1207674c80eef7719db270",
"assets/packages/flutter_country_flags/assets/pr.png": "b496188f51424a776d7ce5d8e28fd022",
"assets/packages/flutter_country_flags/assets/ps.png": "e3e006d28f6b72169c717c1dba49b4d5",
"assets/packages/flutter_country_flags/assets/pt.png": "1fe8c12d96a7536b0aa25a9ca7d3c701",
"assets/packages/flutter_country_flags/assets/pw.png": "5216b69d6d8cb4e50962f8a6531231e8",
"assets/packages/flutter_country_flags/assets/py.png": "4dca66b598604fb3af9dee2fd9622ac4",
"assets/packages/flutter_country_flags/assets/qa.png": "3ed06ed4f403488dd34a747d2869204d",
"assets/packages/flutter_country_flags/assets/re.png": "4fa81d3430e630527b8c6987619e85dc",
"assets/packages/flutter_country_flags/assets/ro.png": "50ada15f78e9828d9886505e0087cbfd",
"assets/packages/flutter_country_flags/assets/rs.png": "0a4c07a0ac5523d6328ab7d162d79d1e",
"assets/packages/flutter_country_flags/assets/ru.png": "6974dcb42ad7eb3add1009ea0c6003e3",
"assets/packages/flutter_country_flags/assets/rw.png": "f6602a0993265061713f34e8a86c42cf",
"assets/packages/flutter_country_flags/assets/sa.png": "60851afd0246c77b57f76f32e853c130",
"assets/packages/flutter_country_flags/assets/sb.png": "12cccb421defca5c7a4d19661f98f06f",
"assets/packages/flutter_country_flags/assets/sc.png": "fce9893562cbe99d2e62a46b03e42007",
"assets/packages/flutter_country_flags/assets/sd.png": "40572a05b7cd8ea53cee59c6be331588",
"assets/packages/flutter_country_flags/assets/se.png": "775da17dccf0768a1f10f21d47942985",
"assets/packages/flutter_country_flags/assets/sg.png": "fd3e4861be787cfde6338870e2c8d60a",
"assets/packages/flutter_country_flags/assets/sh.png": "09af1c5f1433c02e97a95286ce24f4d4",
"assets/packages/flutter_country_flags/assets/si.png": "9fa57dc95640bcd67051d7ff63caa828",
"assets/packages/flutter_country_flags/assets/sj.png": "ae5d87669104732f61cca68d6bd10cbf",
"assets/packages/flutter_country_flags/assets/sk.png": "207097f7d7d1ab9c7c88d16129cdba39",
"assets/packages/flutter_country_flags/assets/sl.png": "61b9d992c8a6a83abc4d432069617811",
"assets/packages/flutter_country_flags/assets/sm.png": "8615f3e38ee216e53895ac9acd31a56b",
"assets/packages/flutter_country_flags/assets/sn.png": "1e8f55378ddd44cdc9868a7d35bda2fe",
"assets/packages/flutter_country_flags/assets/so.png": "2a29df9dfbfbe10d886f1f6157557147",
"assets/packages/flutter_country_flags/assets/sr.png": "b9e4b7fff662b655ce2b41324a04526b",
"assets/packages/flutter_country_flags/assets/ss.png": "bfc79aa44e6d2b026717f7aae4431639",
"assets/packages/flutter_country_flags/assets/st.png": "5abecf1202ef9f7b33bdb9d0e3913f80",
"assets/packages/flutter_country_flags/assets/sv.png": "abe677facaeee030a10987f87831ee53",
"assets/packages/flutter_country_flags/assets/sx.png": "aee87f6ff085fccd57c234f10a6d6052",
"assets/packages/flutter_country_flags/assets/sy.png": "f415bf216f4c08b9a224b83165decc11",
"assets/packages/flutter_country_flags/assets/sz.png": "a06f0fa489d9c9faf0690673242005d2",
"assets/packages/flutter_country_flags/assets/tc.png": "0faabda1411738e572144aaeed24aadd",
"assets/packages/flutter_country_flags/assets/td.png": "343a6c8ad0d15e0a7f44e075dd02082a",
"assets/packages/flutter_country_flags/assets/tf.png": "cc0d9468b31855b29f38ca53eb522067",
"assets/packages/flutter_country_flags/assets/tg.png": "a0f14f046b0356221c6923203bd43373",
"assets/packages/flutter_country_flags/assets/th.png": "aa978ab62657076b0fa36ef0514d4dcf",
"assets/packages/flutter_country_flags/assets/tj.png": "a9e427318b756c0c03bec3f3ff976fa3",
"assets/packages/flutter_country_flags/assets/tk.png": "fcbceb6da21d71232ad719d05b6bb71b",
"assets/packages/flutter_country_flags/assets/tl.png": "5519f1e7173e1f345d1580bab1b34d51",
"assets/packages/flutter_country_flags/assets/tm.png": "9b27cae273a82e046c82a94f380826a6",
"assets/packages/flutter_country_flags/assets/tn.png": "c375381bbdb31c4e80af18210d196d30",
"assets/packages/flutter_country_flags/assets/to.png": "1cdd716b5b5502f85d6161dac6ee6c5b",
"assets/packages/flutter_country_flags/assets/tr.png": "0a832c3bc7481e6b285dabbf1a119e22",
"assets/packages/flutter_country_flags/assets/tt.png": "2633904bd4718afeecfa0503057a7f65",
"assets/packages/flutter_country_flags/assets/tv.png": "d45cf6c6f6ec53ae9b52f77848dc6bf9",
"assets/packages/flutter_country_flags/assets/tw.png": "079535fcbc6e855a85c508c9d1b5615a",
"assets/packages/flutter_country_flags/assets/tz.png": "f8da3c6c3c64726ba9cb58ccfb373de2",
"assets/packages/flutter_country_flags/assets/ua.png": "b4b10d893611470661b079cb30473871",
"assets/packages/flutter_country_flags/assets/ug.png": "3a85e25a9797f7923a898007b727216a",
"assets/packages/flutter_country_flags/assets/um.png": "b2b35d5b34ba0d66fda92e2003cd6b10",
"assets/packages/flutter_country_flags/assets/us.png": "b2b35d5b34ba0d66fda92e2003cd6b10",
"assets/packages/flutter_country_flags/assets/uy.png": "2579723aba2ee05a8d68c9084eaf5588",
"assets/packages/flutter_country_flags/assets/uz.png": "475189379e4a67b29e9ab9a1d71f3cdd",
"assets/packages/flutter_country_flags/assets/va.png": "e84a6f9dc08930a11d1e4b9d25b6234f",
"assets/packages/flutter_country_flags/assets/vc.png": "e6cead4282ee9e362c624b46752aa3d5",
"assets/packages/flutter_country_flags/assets/ve.png": "c177b253feaa781aae0368ae9d55d702",
"assets/packages/flutter_country_flags/assets/vg.png": "420edc09fba1878f87336f8ebcdcee66",
"assets/packages/flutter_country_flags/assets/vi.png": "bfe5691810c27983346bf52eb5149bb4",
"assets/packages/flutter_country_flags/assets/vn.png": "32ff65ccbf31a707a195be2a5141a89b",
"assets/packages/flutter_country_flags/assets/vu.png": "47ba92e2fe9961be0991dc76520dade9",
"assets/packages/flutter_country_flags/assets/wf.png": "6214b3091dbe62c7a6c9991ee6466859",
"assets/packages/flutter_country_flags/assets/ws.png": "d8e4ad3af401330e3f11db4be39dbf32",
"assets/packages/flutter_country_flags/assets/xk.png": "6781f6c7e81d5617769900576c85917e",
"assets/packages/flutter_country_flags/assets/ye.png": "4cf73209d90e9f02ead1565c8fdf59e5",
"assets/packages/flutter_country_flags/assets/yt.png": "4fa81d3430e630527b8c6987619e85dc",
"assets/packages/flutter_country_flags/assets/za.png": "6c93cf2398f55956549f241ef9f32e15",
"assets/packages/flutter_country_flags/assets/zm.png": "e918e6d9756449e9e9fefd52faa0da80",
"assets/packages/flutter_country_flags/assets/zw.png": "6245bb368a8a37c49f2e87331424c1fa",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "396b21b45513d96ab4c6a8dfbbcbed44",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "2d736419d70640f4dacfab9fbc18168a",
"/": "2d736419d70640f4dacfab9fbc18168a",
"main.dart.js": "b42b54cac4fc2d50603abe4102d4bef2",
"manifest.json": "cceef63d44e83dbb3b6fc6c78057df6e",
"version.json": "e9db7d5a66fe5c8daa43ded7a8cde44f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
