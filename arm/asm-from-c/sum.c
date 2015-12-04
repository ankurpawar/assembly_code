int func(int a, int b);

int sum;
int arr[] = {1, 9, 7, 8};
const int n = sizeof(arr) / sizeof(arr[0]);

void main()
{
	int i;
	for (i = 0; i < n; i++)
		sum += arr[i];
	i = func(2,4);
}
