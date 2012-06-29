require 'formula'

class Mongo < Formula
   homepage 'http://www.mongodb.org/'
   url 'https://github.com/downloads/mongodb/mongo-php-driver/osx-php5.3-1.0.11.zip'
   version '1.0.11'
   md5 '19f84e64e85af474a836f900857f1a2d'

   depends_on 'noise/brewery/mamp'
   depends_on 'mongodb'

   def install
      prefix.install 'mongo.so'
      system "cp -R #{prefix}/mongo.so /Applications/MAMP/bin/php/php5.3.6/lib/php/extensions/no-debug-non-zts*/"

      if `cat /Applications/MAMP/bin/php/php5.3.6/conf/php.ini | grep 'mongo.so'` != "" 
         opoo "Extension already exists!"
      else
         ohai 'Adding extension to php.ini'
         system 'echo "extension=mongo.so" >> /Applications/MAMP/bin/php/php5.3.6/conf/php.ini' 
      end

      ##
      # Time to restart MAMP
      ##
      opoo 'Restarting MAMP, requires root access.'
      system 'sudo /Applications/MAMP/bin/stopApache.sh'
      if `ps aux | grep mysql[d]` != ""
         system 'sudo /Applications/MAMP/bin/stopMysql.sh > /dev/null 2>&1 &'
      end
      system 'sudo /Applications/MAMP/bin/startApache.sh'
      system 'sudo -u $USER /Applications/MAMP/bin/startMysql.sh > /dev/null 2>&1 &'
   end

end
