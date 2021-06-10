# 把day1 - day4 下的sql 组合起来 形成一个txt文件

import glob

day = [ 'day'+str(i) for i in range(1,5) ]

fi = open("sql.txt","w")

for d in day:
    f = glob.glob('{}/**/**/*.sql'.format(d))
    f.sort()
    for ff in f:
        fi.write(ff)
        fi.write('\n')
        fi.write('\n')
        with open(ff) as fr:
            fi.writelines( fr.readlines() )


fi.close()


