/**
 * Created by Margaret on 6/26/17.
 */
import Datastore from 'nedb'
import path from 'path'
import { remote } from 'electron'

var db = new Datastore({ filename: 'tmp/data.db', autoload: true  });

var scott = {
  name: 'Scott',
  twitter: '@ScottWRobinson'
};

db.insert(scott, function(err, doc) {
  console.log('Inserted', doc.name, 'with ID', doc._id);
});
