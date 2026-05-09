#!/bin/sh

# extract-multichar-symbols-from-lexc.sh

# Script to extract multicharacter symbols candidates from LEXC code

gawk '{ line=$0;
  sub("!.*$", "", line);
  if(match(line, "^[^;]+;", f)!=0)
    {
      line2=f[0]; # print line2;
      match(line2, "^([^ ]+) ", f);
      lex=f[1]; # print lex;
      n=split(lex, f, ":");
      for(i=1; i<=n; i++)
         {
           m=patsplit(f[i], ff, "@[^@]+@");
           for(j=1; j<=m; j++)
             flags[ff[j]]++;
           m=patsplit(f[i], ff, "[[:lower:]][0-9]+");
           for(j=1; j<=m; j++)
             specs[ff[j]]++;
           m=patsplit(f[i], ff, "\\^([[:upper:]]|[[:digit:]])+");
           for(j=1; j<=m; j++)
             trigs[ff[j]]++;
         }
    }
}
END { PROCINFO["sorted_in"]="@ind_str_asc";
  print "!! Flags";
  for(flag in flags)
     print flag;
  print "";
  print "!! Morphophonemic special characters";
  for(spec in specs)
     print spec;
  print "";
  print "!! Triggers";
  for(trig in trigs)
     print trig;
  print "";
}'

