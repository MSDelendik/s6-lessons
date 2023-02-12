from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from airflow.decorators import dag

import boto3

def fetch_s3_file(bucket: str, key: str):
    # сюда поместить код из скрипта для скачивания файла
    AWS_ACCESS_KEY_ID = "YCAJEWXOyY8Bmyk2eJL-hlt2K"
    AWS_SECRET_ACCESS_KEY = "YCPs52ajb2jNXxOUsL4-pFDL1HnV2BCPd928_ZoA"

    session = boto3.session.Session()
    s3_client = session.client(
    service_name='s3',
    endpoint_url='https://storage.yandexcloud.net',
    aws_access_key_id=AWS_ACCESS_KEY_ID,
    aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
)
#s3_client.download_file(
#   Bucket='sprint6',
#   Key='groups.csv',
#   Filename='/data/groups.csv')
#1

# эту команду надо будет поправить, чтобы она выводила
# первые десять строк каждого файла
bash_command_tmpl = """
echo {{ params.files }}
"""

@dag(schedule_interval=None, start_date=pendulum.parse('2022-07-13'))
def sprint6_dag_get_data():
    bucket_files = ['groups.csv', 'users.csv', 'dialogs.csv']
    task1 = PythonOperator(
        task_id=f'fetch_groups.csv',
        python_callable=fetch_s3_file,
        op_kwargs={'bucket': 'sprint6', 'key': 'group.csv'},
    )

    task2 = PythonOperator(
        task_id=f'fetch_users.csv',
        python_callable=fetch_s3_file,
        op_kwargs={'bucket': 'sprint6', 'key': 'users.csv'},
    )

    task3 = PythonOperator(
        task_id=f'fetch_dialogs.csv',
        python_callable=fetch_s3_file,
        op_kwargs={'bucket': 'sprint6', 'key': 'dialogs.csv'},
    )
    
    print_10_lines_of_each = BashOperator(
        task_id='print_10_lines_of_each',
        bash_command=bash_command_tmpl,
        params={'files': [f'/data/{f}' for f in bucket_files]}
    )

    [task1, task2, task3]

get_s3_files = sprint6_dag_get_data()