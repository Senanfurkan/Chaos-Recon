# Chaos-Recon

You need a "CompanyName.txt" consist of company names as here; `https://github.com/projectdiscovery/chaos-public-program-list/blob/master/scope.json`


Inside of CompanyName.txt
```
verizon_media
vimeo
uber
digitalocean
```

Usage:
`bash chaos.sh`

You can use cronjob to run it automatically everyday. 

After the process completed, 

`cat */*.diff` will give you all daily new subdomains. Backup the differences.diff files for next day and Happy Hacking !
