import re
import random
import string


# Validate domain using regex
def validate_domain(domain):
    domain_regex = re.compile(
        r"^(?:[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?\.)+[a-z]{2,}$", re.IGNORECASE
    )
    return bool(domain_regex.match(domain))


# Generate a unique app name
# App name has a random 4-character alphanumeric string
def generate_app_name():
    return f"nginx-{''.join(random.choices(string.ascii_lowercase + string.digits, k=4))}"


# Generate a public URL
# app_name must be unique ==> genenerated URL is unique for each deployment
def generate_public_url(cloud_provider, domain, namespace, app_name):
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"http://{namespace}.{app_name}.{cloud_provider}.{domain}"