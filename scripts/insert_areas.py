import pandas as pd
import re
from tag.models import Tag, TagGroup

MAPUTILS_REPO = '/Users/ristohietala/ko/maputils'

LOCS = [
    {'taggroup': 1,
     'locfile': MAPUTILS_REPO + '/world/laenor.loc',
     'mapfile': MAPUTILS_REPO + '/world/laenor.map'},
    {'taggroup': 2,
     'locfile': MAPUTILS_REPO + '/world/rothikgen.loc',
     'mapfile': MAPUTILS_REPO + '/world/rothikgen.map'},
    {'taggroup': 3,
     'locfile': MAPUTILS_REPO + '/world/lucentium.loc',
     'mapfile': MAPUTILS_REPO + '/world/lucentium.map'},
    {'taggroup': 4,
     'locfile': MAPUTILS_REPO + '/world/furnachia.loc',
     'mapfile': MAPUTILS_REPO + '/world/furnachia.map'},
    {'taggroup': 5,
     'locfile': MAPUTILS_REPO + '/world/desolathya.loc',
     'mapfile': MAPUTILS_REPO + '/world/desolathya.map'},
]


def areas(df):
    return df[(df.flags.str.contains('C') == False) &
              (df.flags.str.contains('S') == False)]


def playercities(df):
    return df[df.flags.str.contains('C') == True]


def raceshrines(df):
    return df[df.flags.str.contains('S') == True]


def primary_name(s):
    res = re.search('@(.+?)(\|.+)*$', s)
    if res is not None:
        return res.group(1)
    else:
        return re.search('^(.+?)(\|.+)*$', s).group(1)


def readlocations(filename):
    data = pd.read_csv(filename,
                       sep="\s*;\s*",
                       header=None,
                       comment="#",
                       skip_blank_lines=True,
                       names=['x', 'y', 'flags', 'names', 'creators',
                              'timestamp', 'url', 'freeform'])
    d = areas(data)
    d['names'] = d['names'].apply(lambda x: primary_name(x))
    return d


def readmap(filename):
    with open(filename) as f:
        content = map(list, f.read().splitlines())
    return content


def findloc(centreX, centreY, content):
    dx = 2
    dy = 1
    retval = list()
    for y in range(centreY - dy - 1, centreY + dy):
        ry = list()
        for x in range(centreX - dx - 1, centreX + dx):
            ry.append(content[y][x])
        retval.append(''.join(ry))
    return '\n'.join(retval)


def run():
    for loc in LOCS:
        taggroup = TagGroup.objects.get(id=loc['taggroup'])
        mapcontent = readmap(loc['mapfile'])
        locations = readlocations(loc['locfile'])
        for index, l in locations.iterrows():
            Tag(name=l['names'],
                group=taggroup,
                locmap=findloc(l['x'], l['y'], mapcontent)).save()
