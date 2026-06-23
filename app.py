import os
import django
from django.core.management import call_command
from django.core.asgi import get_asgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'TodoListProject.settings')
django.setup()

call_command('migrate', '--noinput')

application = get_asgi_application()

if __name__ == '__main__':
    import uvicorn

    uvicorn.run(application, host='0.0.0.0', port=7860)

