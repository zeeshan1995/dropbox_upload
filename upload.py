
import dropbox

dbx=dropbox.Dropbox('ACCESS_TOKEN'); #its secret!

input_buffer = list();
for line in open('input.txt', 'r'):
				input_buffer.append(line.replace("\n",""));

output_buffer = list();
for line in open('output.txt', 'r'):
				output_buffer.append(line.replace("\n",""));

mode = dropbox.files.WriteMode.overwrite;

for i in range(len(input_buffer)):
				if input_buffer[i].find('.')!=-1:
								print 'Uploading: ' + input_buffer[i]
								dbx.files_upload(open(input_buffer[i],'r').read(),output_buffer[i],mode);
