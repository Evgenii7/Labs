// CMakeProject1.cpp: определяет точку входа для приложения.
//

#include <opencv2/highgui.hpp>
#include "CMakeProject1.h"

using namespace std;

int main()
{
	auto i = cv::imread("D:\\КОПИЯ ФЛЭШКИ\\4 СЕМЕСТР\\Инструментальные средства разработки программного обеспечения Пугин Е.В\\L55\\fot\\f.jpg");
	i = 255 - i; // инверсия изображения
	cv::imwrite("D:\\КОПИЯ ФЛЭШКИ\\4 СЕМЕСТР\\Инструментальные средства разработки программного обеспечения Пугин Е.В\\L55\\fot\\fo.bmp", i);

	cout << "Hello CMake." << endl;
	return 0;
}
