using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ValidateMove : MonoBehaviour
{
    [SerializeField] private float _limitX;
    [SerializeField] private float _maxX;
    [SerializeField] private float _limitZ;
    [SerializeField] private float _maxZ;

    private float _rotateY = 0.8f;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void CheckValidateToMove()
    {
        if (transform.position.x < _limitX)
        {
            transform.position = new Vector3(_limitX, transform.position.y, transform.position.z);
        }
        else if (transform.position.x > _maxX)
        {
            transform.position = new Vector3(_maxX, transform.position.y, transform.position.z);
        }
        else if (transform.position.z < _limitZ)
        {
            transform.position = new Vector3(transform.position.x, transform.position.y, _limitZ);
        }
        else if (transform.position.z > _maxZ)
        {
            transform.position = new Vector3(transform.position.x, transform.position.y, _maxZ);
        }


        //Quaternion
        if (transform.rotation.y < -_rotateY)
        {
            transform.rotation = Quaternion.Euler(0, -80, 0);
        }
        else if (transform.rotation.y > _rotateY)
        {
            transform.rotation = Quaternion.Euler(0, 80, 0);
        }
    }
}
