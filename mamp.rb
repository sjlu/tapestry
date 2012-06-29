require 'formula'

class Mamp < Formula
   homepage 'http://www.mamp.info/en/index.html'
   url 'http://www.mamp.info/downloads/releases/MAMP_PRO.zip'
   version '2.0.5'
   md5 'bb5c94081cceee8572c21139727df35c'

   def options
      [
         ['--fake', 'Fake the install, for people who have it already']
      ]
   end

   def install
      prefix.install 'MAMP.pkg'

      if ARGV.include? '--fake'
         onoe 'Okay, faked the install, no warranty beyond here anymore.'
         return
      end

      # If MAMP is already installed, we'll stop here.
      if File.exists?('/Applications/MAMP/')
         onoe "MAMP is already installed, no need to touch it."
      else
         # Installing, setting permissions.
         opoo 'Installing the MAMP package, will ask you for root password.'
         system "sudo installer -pkg #{prefix}/MAMP.pkg -target /"
         system "sudo chown -R $USER:admin /Applications/MAMP" 
      end

      # Removing MAMP PRO, not needed.
      system 'sudo rm -rf /Applications/MAMP\ PRO'

      # Modifying config files to use default ports.
      system 'sed -i "" "s/Listen 8888/Listen 80/" /Applications/MAMP/conf/apache/httpd.conf'
      system 'sed -i "" "s/--port=8889/--port=3306/g" /Applications/MAMP/bin/startMysql.sh'

      # Blegh, patching MAMP
      system 'sed -i "" "s/&/> \/dev\/null 2>&1 &/" /Applications/MAMP/bin/startMysql.sh'

      # Opening up! 
      system 'sudo open /Applications/MAMP/MAMP.app'
   end

end
