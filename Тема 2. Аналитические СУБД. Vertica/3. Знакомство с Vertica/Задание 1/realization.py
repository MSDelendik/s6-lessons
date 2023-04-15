import vertica_python
from getpass import getpass

conn_info = {'host': '51.250.75.20', 
             'port': '5433',
             'user': 'MLDELENDIKYANDEXRU',       
             'password': 'BA5XD8q7sudmdkC',
             'database': 'dwh',
             # Вначале автокоммит понадобится, а позже решите сами.
                         'autocommit': True
}

def try_select(conn_info=conn_info):
    # Рекомендуем использовать соединение:
    with vertica_python.connect(**conn_info) as conn:
        # Напишите здесь курсор, который выполняет запрос SELECT 1 as a1; 
        cur = conn.cursor()
        cur.execute(""" 
        select 1 as a1
        """)
        res = cur.fetchall()
        return res