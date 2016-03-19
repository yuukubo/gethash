require 'digest/md5'
require 'logger'
log = Logger.new('./gethashval.log', 'daily')
log.info("Program started")

strtime = 0	# process time counter

strcdir = Dir.pwd
strfiles = Dir.glob("#{strcdir}/**/*",File::FNM_DOTMATCH)
strlen = strfiles.length
ctr1 = 0

strmd5 = ""
strtmpfile = ""

puts " ** start ** "
while ctr1 != strlen do
	t_start = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }
	strtmpfile = strfiles[ctr1]
	if File::ftype("#{strtmpfile}") != "directory"
		strmd5 = Digest::MD5.file("#{strtmpfile}").hexdigest()
		log.info("MD5 : #{strmd5} - name : #{strtmpfile}")
	end
	ctr1 += 1
	t_end = Time.now.instance_eval { self.to_i * 1000 + (usec/1000) }
	t_pass = t_end - t_start
	strtime += t_pass
end
strtime = strtime / 10.0 # get average ms
strtime = strtime / 1000.0 # ms to sec

log.info("#{strlen} files or directories processed")
puts "#{strlen} files or directories processed"
puts " ** end ** "
log.info("Program end. average time : #{strtime} sec ")
sleep(2)
