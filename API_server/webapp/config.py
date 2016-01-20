import os
import sys

from django.conf import settings

from webapp import models

#init

__book_cover_api_config = models.WebappConfiguration.objects.get(name__iexact = 'book_cover_api_config')

if not __book_cover_api_config:
    sys.exit('initilization failed - cannot find webapp configuration in db.')

COVER_PATH = __book_cover_api_config.value

DEFAULT_COVER_URL = os.path.join(settings.STATIC_URL, COVER_PATH, __book_cover_api_config.value_1)

DEFAULT_COVER_FILE_PATH = os.path.join(settings.STATIC_PATH, COVER_PATH, __book_cover_api_config.value_1)

SEARCH_MAX_ITEM = 2000

QUERY_TO_GET_BOOK_DEATAIL_BY_CALL_NUMBER = """
SELECT
    READERWARE.CALL_NUMBER, READERWARE.TITLE, CONTRIBUTOR.NAME, READERWARE.ISBN, READERWARE.DEWEY, BOOK_COVER.IMAGE_DIR, SPONSOR.NAME, SPONSOR.CONTACT
FROM
    READERWARE
LEFT JOIN CONTRIBUTOR ON READERWARE.AUTHOR = CONTRIBUTOR.ROWKEY
LEFT JOIN BOOK_COVER ON READERWARE.ROWKEY = BOOK_COVER.BOOK_ID
LEFT JOIN SPONSOR ON READERWARE.SPONSOR = SPONSOR.ROWKEY
WHERE
    READERWARE.CALL_NUMBER = %s
"""
